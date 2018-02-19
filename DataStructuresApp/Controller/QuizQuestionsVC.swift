//
//  QuizQuestionsVC.swift
//  DataStructuresApp
//
//  Created by Ethan Chan on 2018-02-16.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//

import Foundation
import UIKit

class QuizQuestionsVC : UIViewController, UITableViewDelegate, UITableViewDataSource{
    var questionNumber = 0
    var questions = [Any]()
   
    var answers = ["1","1","1","1"]
    var correctAnswer = [Int]()
    var selectedAnswer = [Int]()
    var questionType = "multiple-choice"
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func answer(_ sender: Any) {
        performSegue(withIdentifier: "quizContinue", sender: self)
    }
    @IBAction func button(_ sender: Any) {
        print(answers)
        print(selectedAnswer)
    }
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        let fullQuestion = questions[questionNumber] as! [String: Any]
        let answers = fullQuestion["Answers"] as! [String]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.allowsMultipleSelection = true
        
        //change question
        
        if questionType == "ranking" {
            tableView.isEditing = true
        }
        else if questionType == "true-false"{
            tableView.isHidden = true
            answer1.setTitle("True",for: .normal)
            answer2.setTitle("False",for: .normal)
            answer3.isHidden = true
            answer4.isHidden = true
        }
        else if questionType == "multiple-choice"{
            tableView.isHidden = true
            answer1.setTitle(answers[0],for: .normal)
            answer2.setTitle(answers[1],for: .normal)
            answer3.setTitle(answers[2],for: .normal)
            answer4.setTitle(answers[3],for: .normal)
        }
        
        print(answers)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizContinueVC = segue.destination as! QuizContinueVC
        quizContinueVC.correctAnswer = correctAnswer
        quizContinueVC.selectedAnswer = selectedAnswer
        quizContinueVC.questionNumber = questionNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        cell.question.isEditable = false
        cell.question.isSelectable = false
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
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .none
//    }
    
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
