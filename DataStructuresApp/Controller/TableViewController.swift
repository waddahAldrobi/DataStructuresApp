//
//  TableViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var myIndex = 0
    var lessonNames = ["Pointers", "Linked Lists"]
    var lessonData : [Any] = []
    
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        // This will remove extra separators from tableview
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lessonNames.count
    }
    
    // Same as before
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopicCell
        
        cell.subAppTitle.text = lessonNames[indexPath.item]
        cell.subAppIcon.image = UIImage(named: lessonNames[indexPath.item])
        //cell.textLabel?.text = subApp[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lessonOptionsVC = segue.destination as! LessonOptions // This to indicate that these are
        lessonOptionsVC.myIndex = myIndex
        lessonOptionsVC.lessonData = lessonData
        
        
    }
    
    
    
    // Listens to the tap, that seugue is necessary for index update
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        
        
        
        // MARK: JSON Parsing
        let path = Bundle.main.path(forResource: "JSONData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                      print (json)
            guard let lessonDataArray = json as? [Any] else { print("error444"); return }
            
            //watch this for more info on JSON https://www.youtube.com/watch?v=ih20QtEVCa0
            
            guard let lessonData = lessonDataArray[myIndex] as? [Any] else { print("error888"); return }
            
            // for info on allowed characters in json: https://stackoverflow.com/questions/2392766/multiline-strings-in-json
            
            self.lessonData = lessonData
            
            print("-----------------------------")
            
        } catch {
            
            print(error)        }
        
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

