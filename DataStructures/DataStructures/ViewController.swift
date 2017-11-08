import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        tableView.delegate = self
//        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let sections = controller.sections {
//            let sectionInfo = sections[section]
//
//            return sectionInfo.numberOfObjects
//        }
//
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath) as! topicCell
        print("successful")
        cell.title.text = "Pointers Test"
        cell.details.text = "This is a test"
        cell.thumb.image = UIImage(named: "test")
//        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    
//    func configureCell(cell: topicCell, indexPath: NSIndexPath) {
        
//    }
    


  


}

