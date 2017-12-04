import Foundation
import UIKit

class VisualizationVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    
    @IBOutlet weak var textfield: UITextView!
    
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.landscape , andRotateTo: .landscapeRight)
        
        //Sets title of tab
          self.tabBarController?.navigationItem.title = "Visualization";
    }
    
    
    // Controls orientation
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait) 
    }
   }
