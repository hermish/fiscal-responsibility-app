//
//  WhiteListTableViewController.swift
//  FiscalResponsibility
//
//  Created by Michael Mendiola on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class WhiteListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBAction func whitelist(_ sender: UIButton) {
		performSegue(withIdentifier: "addSegue", sender: sender)
	}
	@IBOutlet weak var tableView: UITableView!
    var whiteList = ["Target", "Walmart", "McDonalds", "Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds","Target", "Walmart", "McDonalds",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableHeader", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "TableHeader")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeader")
//        return headerView
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if
//        return 40
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return whiteList.count //+ 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "whiteListCell", for: indexPath) as! WhiteListTableViewCell
            cell.whiteListLabel.text = whiteList[indexPath.row]
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 40
        } else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            whiteList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


}
