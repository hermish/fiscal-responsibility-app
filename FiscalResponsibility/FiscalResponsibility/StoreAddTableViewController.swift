//
//  StoreAddTableViewController.swift
//  FiscalResponsibility
//
//  Created by Jonson Jin on 1/12/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class StoreAddTableViewController: UITableViewController {

    @IBAction func addPress(_ sender: Any) {
       // Add the fifth item always
        DataManager.sharedInstance.users[DataManager.sharedInstance.lastUser!].whiteList.append(5)
    }
    
    @IBOutlet var storeListTable: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.allowsMultipleSelectionDuringEditing = true
		tableView.setEditing(true, animated: false)

        let homeButton : UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action:  #selector(add))
        
        self.navigationItem.rightBarButtonItem = homeButton
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @objc func add(){
       DataManager.sharedInstance.whitelist.append("Best Buy")
        DataManager.sharedInstance.whitelist.append("Walmart Super Center")
        DataManager.sharedInstance.whitelist.append("Starbucks")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.sharedInstance.stores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeListCell", for: indexPath)
        cell.textLabel?.text=DataManager.sharedInstance.stores[indexPath.row]
        
        return cell
    }
}
