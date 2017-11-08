import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
//    var controller: NSFetchedResultsController<Topic>!
    
//    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//
//        tableView.delegate = self
//        tableView.dataSource = self
        
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
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    
    func configureCell(cell: topicCell, indexPath: NSIndexPath) {
        cell.title.text = "Pointers Test"
        cell.details.text = "This is a test"
        cell.thumb.image = UIImage(named: "test")
    }
    


  


}

