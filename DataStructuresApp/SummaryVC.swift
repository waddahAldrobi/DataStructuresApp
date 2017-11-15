import Foundation
import UIKit

class SummaryVC: UIViewController {
    var myIndex = 5
    
    @IBOutlet weak var textfield: UILabel!
        
        
    override func viewDidLoad() {
        textfield.text = "\(myIndex)"
    }
    
}
