import Foundation
import UIKit

class SummaryVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = ""
    
    @IBOutlet weak var textfield: UILabel!
    
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
        
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
    }
    
    
    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    
      //Sets title of tab
      self.tabBarController?.navigationItem.title = "Summary";
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
    
}
