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
    
    @IBOutlet weak var numberCorrect: UITextView!
    @IBOutlet weak var timeField: UITextView!
    @IBOutlet weak var finishButton: UIButton!
    var questions = [Any]()
    override func viewDidLoad() {
        //get time of finish
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        let totalTime = Double(hour*60 + minutes)
        
        
        let hoursTaken = floor((totalTime - DataSingleton.shared.quizStartTime)/60)
        let minutesTaken = (totalTime - DataSingleton.shared.quizStartTime) - floor((totalTime - DataSingleton.shared.quizStartTime)/60)*60
        
        finishButton.layer.cornerRadius = 5
        numberCorrect.text = "Number Correct: \(DataSingleton.shared.numberCorrect)"
        timeField.text = "Time Taken:\nHours: \(Int(hoursTaken)) Minutes:\(Int(minutesTaken))"
        
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let restart = segue.destination as! QuizVC
//        restart.subLessonData = questions
//    }
}
