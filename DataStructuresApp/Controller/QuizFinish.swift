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
    
    @IBOutlet weak var finishButton: UIButton!
    var questions = [Any]()
    override func viewDidLoad() {
       finishButton.layer.cornerRadius = 5
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let restart = segue.destination as! QuizVC
//        restart.subLessonData = questions
//    }
}
