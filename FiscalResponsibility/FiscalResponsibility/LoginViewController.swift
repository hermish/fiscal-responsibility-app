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
		let acctId = "5a563d195eaa612c093b0af6"
		let merchId = "57cf75cea73e494d8675ec49" //Apple Merchant ID
		AccountRequest().getAccount(acctId, completion: { (account, error) in
			if let error = error{
				print("There is an error: " + error.localizedFailureReason!)
				
			}
			else if let account = account {
				print(account.nickname)
				print()
			}
					})
		

		MerchantRequest().getMerchant(merchId) { (merchant, error) in
			if let error = error {
				print("There is an error: " + error.localizedFailureReason!)
			}
			else if let merchant = merchant{
				let str = ""
				for cat in merchant.category {
					
				}
				print("Merchant's Name:" + merchant.name)
				print("Merchant's Address:" + merchant.address.streetNumber + merchant.address.streetName + merchant.address.city)
				print("Merchant's Category:" + merchant.category[0])
				print("Merchant's Geocode: \(merchant.geocode.lat) , \(merchant.geocode.lng)")
				print("Merchant's Merchant ID:" + merchant.merchantId)
			}
		}
		print()
		
		
		
		
	
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
