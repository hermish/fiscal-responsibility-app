//
//  MapAddViewController.swift
//  FiscalResponsibility
//
//  Created by Jonson Jin on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit
import MapKit

class MapAddViewController: UIViewController, UISearchBarDelegate {
	
	@IBOutlet weak var mapSearch: UISearchBar!
	@IBOutlet weak var map: MKMapView!
	let regionRadius: CLLocationDistance = 1000

	override func viewDidLoad() {
		super.viewDidLoad()
		let startLoc = CLLocation(latitude: 38.886879, longitude: -77.09465183333333)
		self.centerMapOnLocation(location: startLoc)
		mapSearch.delegate = self
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func centerMapOnLocation(location: CLLocation) {
		let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
																  regionRadius, regionRadius)
		map.setRegion(coordinateRegion, animated: true)
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		let address = searchBar.text;
		
		let geoCoder = CLGeocoder()
		geoCoder.geocodeAddressString(address!) { (placemarks, error) in
			guard let placemarks = placemarks,
				let searchlocation = placemarks.first?.location
				else {
					// handle no location found
					return
			}
			self.centerMapOnLocation(location: searchlocation)
		}
	}
	
}
