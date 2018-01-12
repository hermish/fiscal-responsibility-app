//
//  PurchaseViewController.swift
//  FiscalResponsibility
//
//  Created by Hermish Mehta on 1/12/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()

    @IBOutlet weak var restaurantChooser: UIPickerView!
    @IBOutlet weak var textAmount: UITextField!
    
    @IBAction func purchasedPressed(_ sender: Any) {
        let lastUsed = DataManager.sharedInstance.lastUser!
        var new_balance = DataManager.sharedInstance.users[lastUsed]

        let selectedIndex = restaurantChooser.selectedRow(inComponent: 0)
        // let storeName = pickerData[selectedIndex]
        // let categoryType = DataManager.sharedInstance.respective[selectedIndex]
        
        if new_balance.whiteList.contains(selectedIndex) {
            let transferAmt = Double(textAmount.text ?? "") ?? 0
            new_balance.balance -= transferAmt
            DataManager.sharedInstance.users[lastUsed] = new_balance
        } else {
            
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = DataManager.sharedInstance.stores
        // Connect data:
        self.restaurantChooser.delegate = self as! UIPickerViewDelegate
        self.restaurantChooser.dataSource = self as! UIPickerViewDataSource
        
        // Input data into the Array:
    }
    
    // Other Picker Methods
    // The number of columns of data

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
