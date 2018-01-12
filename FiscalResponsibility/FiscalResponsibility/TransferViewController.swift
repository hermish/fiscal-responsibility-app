//
//  TransferViewController.swift
//  FiscalResponsibility
//
//  Created by Michael Mendiola on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class TransferViewController: UIViewController {
    
    @IBOutlet weak var transferAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func donePressed(_ sender: Any) {
        // addFunds()
        let transferAmt = Double(self.transferAmountTextField.text ?? "") ?? 0
        if let userNum = DataManager.sharedInstance.lastUser {
            var lastUser = DataManager.sharedInstance.users[userNum]
            lastUser.balance += transferAmt
            DataManager.sharedInstance.users[userNum] = lastUser
        }
        navigationController?.popViewController(animated: true)
        // self.dismiss(animated: true, completion: nil)
    }
    func addFunds() {
        // DataManager.sharedInstance.transferAmount = Double(transferAmt)!
        // UserDefaults.standard.saveFundTo(kidName: "sam", transferAmount: Double(transferAmt)!)
    }
    

    
}
