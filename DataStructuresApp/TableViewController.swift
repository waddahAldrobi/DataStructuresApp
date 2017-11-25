//
//  TableViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit

var myIndex = 0

var subApp = ["Pointers" , "Linked"]
var subAppDetails = ["Ethan delete the second cell when you see it, ran into the problem of the cells updating to not be identical" , "This is a test" ]

class TableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This will remove extra separators from tableview
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subApp.count
    }
    
    // Same as before
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopicCell
        
        cell.subAppTitle.text = subApp[indexPath.item]
        cell.subAppIcon.image = UIImage(named: subApp[indexPath.item])
        //cell.textLabel?.text = subApp[indexPath.row]
        
        return cell
    }
    
    // Listens to the tap, that seugue is necessary for index update
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

