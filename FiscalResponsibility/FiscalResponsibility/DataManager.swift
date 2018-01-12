//
//  DataManager.swift
//  FiscalResponsibility
//
//  Created by Hermish Mehta on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    static let sharedInstance = DataManager()
    
    var users = [User]()
    var whitelist = ["Target", "Walmart", "McDonalds"]
}

struct User {
    var image:UIImage?
    var firstName:String
    var lastName:String
    var nickName:String
    var accountID:String
}

