//
//  PurchaseViewController.swift
//  FiscalResponsibility
//
//  Created by Hermish Mehta on 1/12/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData = DataManager.sharedInstance.stores
    @IBOutlet weak var restChooser: UIPickerView!
    @IBOutlet weak var textAmount: UITextField!
    
    @IBAction func purchasedPressed(_ sender: Any) {
        let lastUsed = DataManager.sharedInstance.lastUser!
        var new_balance = DataManager.sharedInstance.users[lastUsed]

        let selectedIndex = restChooser.selectedRow(inComponent: 0)
        // let storeName = pickerData[selectedIndex]
        // let categoryType = DataManager.sharedInstance.respective[selectedIndex]
        
        if new_balance.whiteList.contains(selectedIndex) {
            let transferAmt = Double(textAmount.text ?? "") ?? 0
            new_balance.balance -= transferAmt
            DataManager.sharedInstance.users[lastUsed] = new_balance
        } else {
            let alert = UIAlertController(title: "Error",
                                          message: "Spending money here is not allowed!",
                                          preferredStyle: UIAlertControllerStyle.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }

        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = DataManager.sharedInstance.stores
        // Connect data:
        self.restChooser.delegate = self
        self.restChooser.dataSource = self
        
        // Input data into the Array:
    }
    
    // OTHER PICKER METHODS
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
