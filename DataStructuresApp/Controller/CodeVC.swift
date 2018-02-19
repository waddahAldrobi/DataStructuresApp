import Foundation
import UIKit
import Highlightr

let data = ["0","1","2","3"]

class CodeVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    var subLessonData : String = ""
    
//    let highlightr = Highlightr()
//    highlightr.setTheme(to: "paraiso-dark")
//    let code = "let a = 1"
//    // You can omit the second parameter to use automatic language detection.
//    let highlightedCode = highlightr.highlight(code, as: "swift")
    @IBOutlet weak var tableViewCode: UITableView!
 
    @IBOutlet weak var codeText: UITextView!
    
    override func viewDidLoad() {
//        textfield.text = "\(myIndex) \(mySecondIndex)"
        print("in code vc")
        print(subLessonData)
        //codeText.text = subLessonData
        
        //Syntax Highlighting
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "paraiso-dark")
        let code = subLessonData
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: "c++")
        //codeText.attributedText = highlightedCode
    }
    
    
    // Controls orientation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
        
        //Sets title of tab
         self.tabBarController?.navigationItem.title = "Code";
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
    
}


var tap1 = Array(repeating: false, count: data.count)
var tap2 = Array(repeating: false, count: data.count)

//MARK: -Extension Delegate
extension CodeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        if (tap1[myIndex] == false && tap2[myIndex] == false) {tap1[myIndex]=true}
            
        else if (tap1[myIndex] == true && tap2[myIndex] == false) {
            tap1[myIndex]=false
            tap2[myIndex]=true
        }
            
        else if (tap1[myIndex] == false && tap2[myIndex] == true) {tap2[myIndex]=false}
     
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    // Height of the row could change here
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: -Extension DataSource
var run=["r1","r2","r3","r4"]
let run2 = ["t1","t2","t3","t4"]

extension CodeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        myIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCode") as! CodeCell
        
        cell.code.text = data[indexPath.row]
        if (tap1[myIndex] == false && tap2[myIndex] == false){cell.tapLabel.text = "Tap to run"}
        else if (tap1[myIndex] == true && tap2[myIndex] == false){cell.tapLabel.text = run[indexPath.row]}
        else if (tap1[myIndex] == false && tap2[myIndex] == true){cell.tapLabel.text = run2[indexPath.row]}
        
        return cell
    }
}














