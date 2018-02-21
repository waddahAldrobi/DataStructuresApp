//
//  QuizContinueVC.swift
//  DataStructuresApp
//
//  Created by Ethan Chan on 2018-02-16.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//

import Foundation
import UIKit

class QuizContinueVC : UIViewController {
    var questions = [Any]()
    var questionNumber = 0
    var correctAnswer = [Int]() // have it already
    var selectedAnswer = [Int]()
    var totalQuestions = 0
    var numberCorrect = 0
    var answerCorrect = false
    @IBOutlet weak var numberCorrectField: UITextField!
    @IBOutlet weak var correctField: UITextField!
    @IBOutlet weak var correctAnswerField: UITextField!
    
    override func viewDidLoad() {
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //answer checking
        answerCorrect = false
        let fullQuestion = questions[questionNumber] as! [String: Any]
        let questionType = fullQuestion["Question-Type"] as! String
        print("selected ansswer", selectedAnswer)
        print(correctAnswer)
        if questionType == "ranking"{
            if correctAnswer == selectedAnswer {
                answerCorrect = true
            }
        } else {
                if (correctAnswer.sorted() == selectedAnswer.sorted()){
                    answerCorrect = true
                }
        }
        
        correctAnswerField.isHidden = true
        //answer showing
        if !answerCorrect {
            //show correct answer
            correctField.text = "Wrong!"
            correctAnswerField.isHidden = false
            correctAnswerField.text = "The correct answer is: \(correctAnswer)"
        }
        print(selectedAnswer)
        numberCorrectField.text = "You got \(numberCorrect) / \(totalQuestions) correct"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizQuestionsVC = segue.destination as! QuizQuestionsVC
        quizQuestionsVC.questionNumber = questionNumber + 1
        quizQuestionsVC.questions = questions
    }
}
