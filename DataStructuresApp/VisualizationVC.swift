import Foundation
import UIKit

class VisualizationVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    
    @IBOutlet weak var textfield: UILabel!
    
    
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
    }
}
