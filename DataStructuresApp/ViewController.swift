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

// For passing data into next VC (replace XXXX with the vc class name and specify segue
    
    override func prepare(for segue: , sender: Self) {
        var destVC: XXXX = segue.destinationViewController as XXXXX
            destVC.myIndex = myIndex
    }
}

