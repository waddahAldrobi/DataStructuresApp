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

var pointers = ["Single Pointers", "Double Pointer", "Memory Management", "Quiz" ]

// Add more buttons, if one has more than the other
// Then, set in the array string to "", and use the isEnabled function
// and set it to false

class SubLessons: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Everything that has to do with the back button - to be removed or fixed
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SubLessons.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        // Makes the text of back button "Back" for the NEXT VC
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        _ = navigationController?.popToRootViewController(animated: true)
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

extension SubLessons : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        DataSingleton.shared.sublessonIdentifier = indexPath.row
        
        if(indexPath.row == 3){
            performSegue(withIdentifier: "quizSegue", sender: self)
        }
        else{
            performSegue(withIdentifier: "lessonSegue", sender: self)
        }
        
    }
}

extension SubLessons : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sublessonsCell") as! SubLessonsCell
        cell.subLessonTitle.text = pointers[indexPath.row]
        return cell
    }
    
}






