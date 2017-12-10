import Foundation
import UIKit


class SummaryVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    var text = ""

    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        
//        "\(myIndex) \(mySecondIndex)"
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        
    
        textview.text = text
        print(text)
        
        // var trial = "• This is a list item! \n• This is too! " copy and paste 
    }
    
    
    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
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

