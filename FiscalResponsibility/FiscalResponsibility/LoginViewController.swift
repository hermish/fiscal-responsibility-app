//
//  LoginViewController.swift
//  FiscalResponsibility
//
//  Created by Jonson Jin on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet weak var username: UITextField!
	@IBOutlet weak var password: UITextField!
	@IBOutlet weak var labelMessage: UILabel!
	
	@IBAction func userLogin(_ sender: UIButton) {
		if username.text == "User" && password.text == "Pass" {
			
//			AccountRequest().getAccount("5a563d195eaa612c093b0af6", completion: { (account, error) in
//				if let account = account {
//					print(account.nickname)
//				}
//				else if let error = error{
//
//				}
//			})
			
			performSegue(withIdentifier: "loginSegue", sender: sender)
		}
		else {
			labelMessage.text = "Invalid username or password"
		}
		
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
