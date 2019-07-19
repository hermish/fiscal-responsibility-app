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
            performSegue(withIdentifier: "loginSegue", sender: sender)
        }
        else {
            labelMessage.text = "Invalid username or password"
        }
    }
    
    @IBAction func overrideLoging(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
