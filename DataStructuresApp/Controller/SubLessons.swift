//
//  ViewController.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2017-11-13.
//  Copyright © 2017 Waddah Aldrobi. All rights reserved.
//

import UIKit


var subLessons = [""]


class SubLessons: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subLessons = DataSingleton.shared.subLessonTitles[DataSingleton.shared.lessonIdentifier]
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
//        // Or to rotate and lock
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
//        AppUtility.lockOrientation(.portrait)
    }
}

extension SubLessons : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        DataSingleton.shared.sublessonIdentifier = indexPath.row
        
        if(indexPath.row == subLessons.count - 1){
            performSegue(withIdentifier: "quizSegue", sender: self)
        }
        else{
            performSegue(withIdentifier: "lessonSegue", sender: self)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        
    }
    
}

let cellSpacingHeight: CGFloat = 10

extension SubLessons : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return subLessons.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sublessonsCell") as! SubLessonsCell
        
        // note that indexPath.section is used rather than indexPath.row
        cell.subLessonTitle.text = subLessons[indexPath.section]
        
        //Just some UI stuff
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        //Lets the scrolling be off/on dependng on how many sections
        tableView.alwaysBounceVertical = false
        
        return cell
    }
    
}






