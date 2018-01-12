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

        // Do any additional setup after loading the view.
    }

    @IBAction func donePressed(_ sender: Any) {
        addFunds()
        navigationController?.popViewController(animated: true)
    }
    func addFunds() {
        let transferAmt = self.transferAmountTextField.text!
        print(transferAmt)
    }
    
}
