import Foundation
import UIKit

class QuizVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    var subLessonData = [Any]()
    
    //    let highlightr = Highlightr()
    //    highlightr.setTheme(to: "paraiso-dark")
    //    let code = "let a = 1"
    //    // You can omit the second parameter to use automatic language detection.
    //    let highlightedCode = highlightr.highlight(code, as: "swift")
    
    
    override func viewDidLoad() {
        //textfield.text = "\(myIndex) \(mySecondIndex)"
        print("in quiz vc")
        print(subLessonData)
        
        

        
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
        let destVC4 = segue.destination as! QuizQuestionsVC
        destVC4.questions = subLessonData
        destVC4.questionNumber = 0
    }
    
    
}

