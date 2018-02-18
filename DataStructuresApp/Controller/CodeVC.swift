import Foundation
import UIKit
import Highlightr

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
    let data = ["0","1","2","3"]
 
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

var tap1 = false

// Extension
extension CodeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tap1 == false) {tap1=true}
        else if (tap1 == true) {tap1=false}
        print (tap1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    // Height of the row could change here
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// Extension
var run=["r1","r2","r3","r4"]
extension CodeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCode") as! CodeCell
        
        cell.code.text = data[indexPath.row]
        if (tap1 == false){
            cell.tapLabel.text = "Tap to run the code"
        }
        else if (tap1 == true){
            cell.tapLabel.text = run[indexPath.row]
        }
        
        return cell
    }
}














