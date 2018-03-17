import Foundation
import UIKit

class QuizVC: UIViewController {
    //    let highlightr = Highlightr()
    //    highlightr.setTheme(to: "paraiso-dark")
    //    let code = "let a = 1"
    //    // You can omit the second parameter to use automatic language detection.
    //    let highlightedCode = highlightr.highlight(code, as: "swift")
    
    @IBOutlet weak var beginButton: UIButton!
    
    override func viewDidLoad() {
        beginButton.layer.cornerRadius = 5
    }
    
    // Controls orientation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
        
        //Sets title of tab
//        self.tabBarController?.navigationItem.title = "Quiz";
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Don't forget to reset when view is being removed
//        AppUtility.lockOrientation(.portrait)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! QuizQuestionsVC
        destVC.questionNumber = 0
    }
    
    
}

