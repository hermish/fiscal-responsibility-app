//
//  Address.swift
//  Nessie-iOS-Wrapper
//
//  Created by Mecklenburg, William on 5/5/15.
//  Copyright (c) 2015 Nessie. All rights reserved.
//

import Foundation


open class Geocode {
    let lng: NSNumber
    let lat: NSNumber

    internal init(data: JSON) {
        lng = data["lng"].number ?? 0
        lat = data["lat"].number ?? 0
    }

    public init(lng: NSNumber, lat: NSNumber) {
        self.lng = lng
        self.lat = lat
    }
}

open class Address {
    open let streetNumber:String
    open let streetName:String
    open let city:String
    open let state:String
    open let zipCode:String
    
    internal init(data: JSON) {
        streetName = data["street_name"].string ?? ""
        streetNumber = data["street_number"].string ?? ""
        city = data["city"].string ?? ""
        state = data["state"].string ?? ""
        zipCode = data["zip"].string ?? ""
    }
    
    public init(streetName:String, streetNumber:String, city:String, state:String, zipCode:String) {
        self.streetName = streetName
        self.streetNumber = streetNumber
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
    internal func toDict() -> Dictionary<String,AnyObject> {
        let dict = ["street_name":streetName,"street_number":streetNumber,"state":state, "city":city, "zip":zipCode]
        return dict as Dictionary<String, AnyObject>
    }
}
