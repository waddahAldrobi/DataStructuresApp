//
//  ViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit
var tab1arr = ["Single Pointers" , "Linked Pointers"]
var tab2arr = ["Double Pointer2" , "Linked Pointers2"]
var tab3arr = ["Memory3" , "Linked Pointers3"]



class ViewController: UIViewController {

    
    @IBOutlet weak var tab1: UIButton!
    @IBOutlet weak var tab2: UIButton!
    @IBOutlet weak var tab3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(myIndex)
        
        // These will change the buttons
        tab1.setTitle(tab1arr[myIndex], for: UIControlState.normal)
        tab2.setTitle(tab2arr[myIndex], for: UIControlState.normal)
        tab3.setTitle(tab3arr[myIndex], for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Hit Here")
        let tabCtrl = segue.destination as! UITabBarController // This to indicate that these are

// sets index depending on the topic chosen
            let destVC1 = tabCtrl.viewControllers![0] as! SummaryVC
            destVC1.myIndex = myIndex
        
            let destVC2 = tabCtrl.viewControllers![1] as! VisualizationVC
            destVC2.myIndex = myIndex
        
            let destVC3 = tabCtrl.viewControllers![2] as! CodeVC
            destVC3.myIndex = myIndex
        
//sets second index depending on button pressed
// need to create data set that loads appropriate information.
            if (segue.identifier == "firstTabSegue") {
                destVC1.mySecondIndex = "First Button"
                destVC2.mySecondIndex = "First Button2"
                destVC3.mySecondIndex = "First Button3"
            } else if (segue.identifier == "secondTabSegue") {
                destVC1.mySecondIndex = "Second Button"
                destVC2.mySecondIndex = "Second Button2"
                destVC3.mySecondIndex = "Second Button3"
            } else if (segue.identifier == "thirdTabSegue") {
                destVC1.mySecondIndex = "Third Button"
                destVC2.mySecondIndex = "Third Button2"
                destVC3.mySecondIndex = "Third Button3"
            }
        }
    
    
    // Controls orientation 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
}

 // fetch form this array with these indexes
