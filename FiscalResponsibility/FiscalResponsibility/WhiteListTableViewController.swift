//
//  WhiteListTableViewController.swift
//  FiscalResponsibility
//
//  Created by Michael Mendiola on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class WhiteListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var whiteList = DataManager.sharedInstance.whitelist

	@IBAction func whitelist(_ sender: UIButton) {
		performSegue(withIdentifier: "addSegue", sender: sender)
	}
    @IBAction func showPurchase(_ sender: Any) {
        // performSegue(withIdentifier: "showPurchaseSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView.register(UINib(nibName: "TableHeader", bundle: nil),
        //                   forHeaderFooterViewReuseIdentifier: "TableHeader")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        if let userNum = DataManager.sharedInstance.lastUser {
            let lastUser = DataManager.sharedInstance.users[userNum]
            balanceLabel.text = "$\(lastUser.balance)"
            nameLabel.text = "\(lastUser.firstName) \(lastUser.lastName)"
            imageLabel.image = lastUser.image ?? #imageLiteral(resourceName: "hqdefault.jpg")
        }
    }

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.sharedInstance.whitelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "whiteListCell", for: indexPath) as! WhiteListTableViewCell
            cell.whiteListLabel.text = DataManager.sharedInstance.whitelist[indexPath.row]
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManager.sharedInstance.whitelist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
