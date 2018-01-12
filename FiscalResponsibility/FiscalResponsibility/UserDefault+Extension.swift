//
//  UserDefault+Extension.swift
//  FiscalResponsibility
//
//  Created by Michael Mendiola on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import Foundation

extension UserDefaults {
    func saveFundTo(kidName: String, transferAmount: Double) {
        if var amount = object(forKey: kidName) as? Double {
            amount += transferAmount
            set(amount, forKey: kidName)
        } else {
            set(transferAmount, forKey: kidName)
        }
        synchronize()
    }
    
    func getAmountFrom(kidName: String) -> Double {
        return object(forKey: kidName) as? Double ?? 0.00
    }
}
