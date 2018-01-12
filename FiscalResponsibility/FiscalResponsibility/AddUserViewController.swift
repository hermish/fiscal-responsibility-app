//
//  AddUserViewController.swift
//  FiscalResponsibility
//
//  Created by Hermish Mehta on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    var userImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        updateUsers()
    }
    
    @IBAction func addPhotoPressed(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func updateUsers() {
        
        let firstName = self.firstName.text!
        let lastName = self.lastName.text!
        let cardNumber = self.cardNumber.text!
        let nickName = self.nickName.text!
        let photo = self.userImage!
        
        let user = User(image: photo, firstName: firstName
            , lastName: lastName, nickName: nickName, cardNumber: cardNumber)

        DataManager.sharedInstance.users.append(user)
        UserDefaults.standard.saveFundTo(kidName: firstName, transferAmount: 0.00)
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        userImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        image.image = userImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
