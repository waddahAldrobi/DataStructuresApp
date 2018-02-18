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
<<<<<<< HEAD
    var numberCorrect = 0
    @IBOutlet weak var numberCorrectField: UITextField!
=======
>>>>>>> 9ff8cedbd42569509dfab1774d076ac2b8422b18
    
    override func viewDidLoad() {
        numberCorrectField.text = "You got \(numberCorrect) / \(totalQuestions) correct"
    }
}
