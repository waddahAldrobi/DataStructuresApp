//
//  TableViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit

class Lessons: UITableViewController {
    
    var lessonNames = ["Pointers", "Linked Lists"]
    
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load data from json
        print(DataSingleton.shared.data)
        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        // This will remove extra separators from tableview
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lessonNames.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopicCell
        cell.subAppTitle.text = lessonNames[indexPath.item]
        cell.subAppIcon.image = UIImage(named: lessonNames[indexPath.item])
        return cell
    }
    
    
    // Listens to the tap, that segue is necessary for index update
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DataSingleton.shared.lessonIdentifier = indexPath.row
        print(DataSingleton.shared.lessonIdentifier)
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

