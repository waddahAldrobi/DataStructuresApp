import UIKit
import CoreData

//www.youtube.com/watch?v=A6Wl8ySrOZI << watch that video if you're confused about the refactoring of the code. Also watch it just so you understand identifies of Segues (transitions) and how they work.... Delete this comment once you read it OR add a new .txt file for these useful comments especially when there are links involved.

// Intiliazing all the components of a sub app
var subApp = ["Pointers Test" , "Linked"]
var subAppDetails = ["Ethan delete the second cell when you see it, ran into the problem of the cells updating to not be identical" , "This is a test" ]
var subAppImage = ["test", "tesla"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    Automatically will return the numbe of subApps
        return subApp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath) as! topicCell
        
        // They have changed into
        print("successful")
        cell.title.text = subApp[indexPath.item]
        cell.details.text = subAppDetails[indexPath.item]
        cell.thumb.image = UIImage(named: subAppImage[indexPath.item])
        
        cell.title.isEditable = false
        cell.details.isEditable = false
//        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
//    // Listens to the tap of a button and prodocues sets myIndex to the index of the tapped cell
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            performSegue(withIdentifier: "mainTransition", sender: self)
//    }

}

