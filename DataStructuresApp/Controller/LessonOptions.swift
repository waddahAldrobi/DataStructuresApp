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
var globalLessonData : [Any] = []

// Add more buttons, if one has more than the other
// Then, set in the array string to "", and use the isEnabled function
// and set it to false

class LessonOptions: UIViewController {

    var myIndex = 0
    var lessonData : [Any] = []
    
    @IBOutlet weak var tab1: UIButton!
    @IBOutlet weak var tab2: UIButton!
    @IBOutlet weak var tab3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalLessonData = lessonData
        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    
        
        // Do any additional setup after loading the view, typically from a nib.
//        print(myIndex)
        
        print("dddddddddddddddddddddddd")
        print(lessonData)
        
        
        // These will change the buttons
        tab1.setTitle(tab1arr[myIndex], for: .normal)
        tab2.setTitle(tab2arr[myIndex], for: .normal)
        tab3.setTitle(tab3arr[myIndex], for: .normal)
        //tab3.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        lessonData = globalLessonData
        print("global lesson data passed")
        print(lessonData)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Hit Here")
        if !(segue.identifier == "quizSegue") {
        let tabCtrl = segue.destination as! UITabBarController // This to indicate that these are
        
            // sets index depending on the topic chosen
            let destVC1 = tabCtrl.viewControllers![0] as! SummaryVC
            destVC1.myIndex = myIndex

            let destVC2 = tabCtrl.viewControllers![1] as! VisualizationVC
            destVC2.myIndex = myIndex

            let destVC3 = tabCtrl.viewControllers![2] as! CodeVC
            destVC3.myIndex = myIndex
            
            if (segue.identifier == "firstTabSegue") {
                guard let subLessonData = lessonData[0] as? [String : Any] else { print("error888"); return }
                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
            } else if (segue.identifier == "secondTabSegue") {
                guard let subLessonData = lessonData[1] as? [String : Any] else { print("error888"); return }
                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
            } else if (segue.identifier == "thirdTabSegue") {
                guard let subLessonData = lessonData[2] as? [String : Any] else { print("error888"); return }
                destVC1.subLessonData = (subLessonData["Summary"] as? String)!
                destVC2.subLessonData = (subLessonData["Visualization"] as? [String: Any])!
                destVC3.subLessonData = (subLessonData["Code"] as? [String:Any])!
            }
        }


            //sets second index depending on button pressed
            // need to create data set that loads appropriate information.
            if (segue.identifier == "quizSegue") {
                guard let subLessonData = lessonData[3] as? [String : Any] else { print("error888"); return }
                let destVC = segue.destination as! QuizVC
                destVC.subLessonData = (subLessonData["Quiz"] as? [Any])!
                
            }
        
        //old style
//        if (segue.identifier == "firstTabSegue") {
//            destVC1.mySecondIndex = "First Button"
//            destVC2.mySecondIndex = "First Button2"
//            destVC3.mySecondIndex = "First Button3"
//        } else if (segue.identifier == "secondTabSegue") {
//            destVC1.mySecondIndex = "Second Button"
//            destVC2.mySecondIndex = "Second Button2"
//            destVC3.mySecondIndex = "Second Button3"
//        } else if (segue.identifier == "thirdTabSegue") {
//            destVC1.mySecondIndex = "Third Button"
//            destVC2.mySecondIndex = "Third Button2"
//            destVC3.mySecondIndex = "Third Button3"
//        }
        }
    
    
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

 // fetch form this array with these indexes
