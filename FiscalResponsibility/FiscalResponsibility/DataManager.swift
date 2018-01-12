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
    
    var categories = ["Technology", "Grocery", "Coffee", "Bars", "Restaurants", "Clothing", "Other"]
	
	var stores = ["Apple", "AT&T", "Electronic Frontier Foundation","Best Buy", "Tops Friendly Market",
				  "Walmart Super Center", "Wegmans", "Kroger", "Starbucks", "Ithica Coffee Company",
				  "Gimme! Coffee", "Greyhouse Coffee & Supply Co.", "Triphammer Wines & Spirits",
				  "Ithica Beer Co", "The Haunt",	"Northeast Pizza & Beer Co", "Buffalo Wild Wings",
				  "Mahogany Grill", "The Boatyard Grill", "Saigon Grill", "Terra Rosa", "Dockers",
				  "Urban Outfitters", "JCPenny"]
}

struct User {
    var image:UIImage?
    var firstName:String
    var lastName:String
    var nickName:String
    var accountID:String
}

