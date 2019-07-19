//
//  UserListTableViewController.swift
//  FiscalResponsibility
//
//  Created by Michael Mendiola on 1/11/18.
//  Copyright © 2018 CapitalOneSummit. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    var users:[User]?
    
    override func viewDidLoad() {
		DataManager.sharedInstance.users.append(User(image: #imageLiteral(resourceName: "hqdefault.jpg"), firstName: "Hermish", lastName: "Mehta", nickName: "My School Card", accountID: "746378276134", balance: 100, whiteList: [0]))
        // self.performSegue(withIdentifier: "SegueToUserVC", sender: self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = DataManager.sharedInstance.users
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Grab cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! UserTableViewCell

        // Configure cell
        let user = users![indexPath.row] as User
        cell.userImage.image = user.image ?? #imageLiteral(resourceName: "hqdefault.jpg")
        cell.userAccountID.text = user.accountID
        cell.userName.text = user.nickName.isEmpty ?
            "\(user.firstName) \(user.lastName)" :
            "\(user.nickName)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users![indexPath.row]
        DataManager.sharedInstance.lastUser = indexPath.row
        self.performSegue(withIdentifier: "SegueToUserVC", sender: selectedUser)
    }   
}
