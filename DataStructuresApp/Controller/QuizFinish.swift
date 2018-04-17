//
//  QuizFinish.swift
//  DataStructuresApp
//
//  Created by Ethan Chan on 2018-03-04.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//

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
    
    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let restart = segue.destination as! QuizVC
//        restart.subLessonData = questions
//    }
}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
