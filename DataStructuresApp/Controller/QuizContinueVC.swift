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
    
    var totalQuestions = 0
    var numberCorrect = 0
    @IBOutlet weak var numberCorrectField: UITextField!

    override func viewDidLoad() {
        numberCorrectField.text = "You got \(numberCorrect) / \(totalQuestions) correct"
    }
}
