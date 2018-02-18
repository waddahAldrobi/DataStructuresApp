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
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    
    @IBAction func button(_ sender: Any) {
        print(tableData)
        print(selected)
        
    }
    @IBOutlet weak var tableView: UITableView!
    var selected = [Int]()
    var tableData = ["one", "two", "three", "four"]
    var questionType = "multiple-choice"
    var answer = 1
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        if questionType == "ranking"{
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
            answer1.setTitle(tableData[0],for: .normal)
            answer2.setTitle(tableData[1],for: .normal)
            answer3.setTitle(tableData[2],for: .normal)
            answer4.setTitle(tableData[3],for: .normal)
        }
        tableView.allowsMultipleSelection = true
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        cell.question.isEditable = false
        cell.question.isSelectable = false
        cell.question.text = tableData[indexPath.row]
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
        let itemToMove = tableData[sourceIndexPath.row]
        tableData.remove(at: sourceIndexPath.row)
        tableData.insert(itemToMove, at: destinationIndexPath.row)
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
        selected.append(indexPath.row)
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
        
        while ((selected.index(of: indexPath.row)) != nil){
            selected.remove(at: selected.index(of: indexPath.row)!)
        }
    }
    
    
}
