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
    
    totalQuestions = 0
    numberCorrect = 0
    @IBOutlet weak var numberCorrect: UITextField!
    
    override func viewDidLoad() {
        numberCorrect.text = "You got \(numberCorrect) / \(totalQuestions) correct"
    }
}
