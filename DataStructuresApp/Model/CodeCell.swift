import Foundation
import UIKit

class CodeCell : UITableViewCell, UITableViewDelegate{
    @IBOutlet weak var code: UITextView!
    
    @IBOutlet weak var tapLabel: UITextView!
    
    @IBOutlet weak var tapLabelBottomConstraint: NSLayoutConstraint!
}
