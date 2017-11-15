//
//  ViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit
var tab1arr = ["Single Pointer!" , "Linked Pointers"]
var tab2arr = ["Double Pointer23" , "Linked Pointers2"]
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
        if (segue.identifier == "firstTabSegue") {
            let destVC = tabCtrl.viewControllers![0] as! SummaryVC
            destVC.myIndex = myIndex
        }
    }
}

