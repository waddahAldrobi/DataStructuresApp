//
//  ViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit
var tab1arr = ["Single Pointers" , "Linked Lists vs Arrays"]
var tab2arr = ["Double Pointer" , "Singly Linked List/ Doubly Linked Lists"]
var tab3arr = ["Memory Management" , "Circulaurly Linked Lists"]

// Add more buttons, if one has more than the other
// Then, set in the array string to "", and use the isEnabled function
// and set it to false

class SubLessons: UIViewController {
    
    @IBOutlet weak var tab1: UIButton!
    @IBOutlet weak var tab2: UIButton!
    @IBOutlet weak var tab3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    
        // These will change the buttons
        tab1.setTitle(tab1arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        tab2.setTitle(tab2arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        tab3.setTitle(tab3arr[DataSingleton.shared.lessonIdentifier], for: .normal)
        //tab3.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "firstTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 0
        } else if (segue.identifier == "secondTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 1
        } else if (segue.identifier == "thirdTabSegue") {
            DataSingleton.shared.sublessonIdentifier = 2
        } else if (segue.identifier == "quizSegue") {
            DataSingleton.shared.sublessonIdentifier = 3
        }
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("Hit Here")
//        if !(segue.identifier == "quizSegue") {
//        let tabCtrl = segue.destination as! UITabBarController // This to indicate that these are
//
//            // sets index depending on the topic chosen
//            let destVC1 = tabCtrl.viewControllers![0] as! SummaryVC
//            destVC1.myIndex = myIndex
//
//            let destVC2 = tabCtrl.viewControllers![1] as! VisualizationVC
//            destVC2.myIndex = myIndex
//
//            let destVC3 = tabCtrl.viewControllers![2] as! CodeVC
//            destVC3.myIndex = myIndex
//
//            if (segue.identifier == "firstTabSegue") {
//                guard let subLessonData = lessonData[0] as? [String : Any] else { print("error888"); return }
//                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
//                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
//                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
//            } else if (segue.identifier == "secondTabSegue") {
//                guard let subLessonData = lessonData[1] as? [String : Any] else { print("error888"); return }
//                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
//                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
//                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
//            } else if (segue.identifier == "thirdTabSegue") {
//                guard let subLessonData = lessonData[2] as? [String : Any] else { print("error888"); return }
//                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
//                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
//                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
//            }
//        }
//
//
//            //sets second index depending on button pressed
//            if (segue.identifier == "quizSegue") {
//                guard let subLessonData = lessonData[3] as? [String : Any] else { print("error888"); return }
//                let destVC = segue.destination as! QuizVC
//                destVC.subLessonData = (subLessonData["Quiz"] as? [Any])!
//
//            }
//
//        }
    
    
    // Controls orientation 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
}
