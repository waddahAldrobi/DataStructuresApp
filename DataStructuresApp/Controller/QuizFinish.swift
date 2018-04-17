import Foundation
import UIKit
class QuizFinish: UIViewController {

    @IBOutlet weak var timeField: UITextView!
    @IBOutlet weak var finishButton: UIButton!
    var questions = [Any]()
    override func viewDidLoad() {
        //get time of finish
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        let seconds = Calendar.current.component(.second, from: Date())
        let totalTime = ceil((Double(hour*3600 + minutes*60 + seconds) - DataSingleton.shared.quizStartTime)/60)
        
        
        finishButton.layer.cornerRadius = 5
        timeField.text =
        """
        Number Correct: \(DataSingleton.shared.numberCorrect)
        Time Taken: \(Int(totalTime)) minutes
        """
        
    }
}


