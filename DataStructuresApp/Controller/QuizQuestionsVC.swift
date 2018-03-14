//
//  QuizQuestionsVC.swift
//  DataStructuresApp
//
//  Created by Ethan Chan on 2018-02-16.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//

import Foundation
import UIKit
import Highlightr

class QuizQuestionsVC : UIViewController, UITableViewDelegate, UITableViewDataSource{
    var questionNumber = 0
    var questions = [Any]()
    var highlightr = Highlightr()
    let textStorage = CodeAttributedString()
    
    var answers = ["0", "0", "0", "0"]
    var selectedAnswer = [Int]()
    var questionType = ""
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var question: UITextView!
    @IBOutlet weak var tableView: UITableView!
    

    
    @IBAction func checkAnswer(_ sender: UIButton) {
        if sender.tag != 5{
            selectedAnswer = [sender.tag]
        }
        performSegue(withIdentifier: "quizContinue", sender: self)
    }
    @IBOutlet weak var checkAnswer: UIButton!
    
    
    override func viewDidLoad() {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizContinueVC = segue.destination as! QuizContinueVC
        quizContinueVC.questionNumber = questionNumber
        quizContinueVC.questions = questions
        if questionType == "ranking"{
            let fullQuestion = questions[questionNumber] as! [String: Any]
            let tempAnswer = fullQuestion["Answers"] as! [String]
            selectedAnswer = []
            for i in answers{
                selectedAnswer.append(tempAnswer.index(of: i)!)
                print(i, tempAnswer.index(of: i)!)
            }

            
        }
        quizContinueVC.selectedAnswer = selectedAnswer
    }
    override func viewWillAppear(_ animated: Bool) {
        print(questions)
        selectedAnswer = [] // to ensure a second attempt at the question does not append selections\
        print("Questions Number: \(questionNumber)")
        let fullQuestion = questions[questionNumber] as! [String: Any]
        
        self.answers = fullQuestion["Answers"] as! [String]
        self.questionType = fullQuestion["Question-Type"] as! String
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.allowsMultipleSelection = true
        
        //change question
        textStorage.highlightr.setTheme(to: "color-brewer")
        let questionText = fullQuestion["Question"] as? String
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = textStorage.highlightr.highlight(questionText!, as: "c++")
        self.question.attributedText = highlightedCode
        self.question.font = UIFont(name: "American Typewriter", size: 18)
//        self.question.backgroundColor = textStorage.highlightr.theme.themeBackgroundColor

        
        if questionType == "ranking" {
            tableView.isEditing = true
           
        }
        else if questionType == "true-false"{
            tableView.isHidden = true
            answer1.setTitle("True",for: .normal)
            answer2.setTitle("False",for: .normal)
            answer3.isHidden = true
            answer4.isHidden = true
            checkAnswer.isHidden = true
        }
        else if questionType == "multiple-choice"{
            tableView.isHidden = true
            answer1.setTitle(answers[0],for: .normal)
            answer2.setTitle(answers[1],for: .normal)
            answer3.setTitle(answers[2],for: .normal)
            answer4.setTitle(answers[3],for: .normal)
            checkAnswer.isHidden = true
        }
        tableView.reloadData()
        print(answers)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
//        cell.question.isEditable = false
//        cell.question.isSelectable = false
        cell.question.isUserInteractionEnabled = false
        cell.question.text = answers[indexPath.row]
        

//        cell.accessoryType = UITableViewCellAccessoryType.checkmark
//        cell.accessoryType = cell.isSelected ? .checkmark : .none
//        cell.selectionStyle = .none
//        if cell.isSelected
//        {
//            cell.isSelected = false
//            if cell.accessoryType == UITableViewCellAccessoryType.none
//            {
//                cell.accessoryType = UITableViewCellAccessoryType.checkmark
//            }
//            else
//            {
//                cell.accessoryType = UITableViewCellAccessoryType.none
//            }
//        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = answers[sourceIndexPath.row]
        answers.remove(at: sourceIndexPath.row)
        answers.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
//        cell.selectedBackgroundView = UIView(frame: cell.frame)
//        cell.selectedBackgroundView?.backgroundColor = UIColor.clear
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.checkmark
        selectedAnswer.append(indexPath.row)
//        if cell.isSelected
//        {
//            cell.isSelected = false
//            if cell.accessoryType == UITableViewCellAccessoryType.none
//            {
//                cell.accessoryType = UITableViewCellAccessoryType.checkmark
//            }
//            else
//            {
//                cell.accessoryType = UITableViewCellAccessoryType.none
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let cell = tableView.cellForRow(at: indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.none
        
        while ((selectedAnswer.index(of: indexPath.row)) != nil){
            selectedAnswer.remove(at: selectedAnswer.index(of: indexPath.row)!)
        }
    }
    
    
}
