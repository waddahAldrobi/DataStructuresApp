import Foundation
import UIKit
import Highlightr

class CodeVC: UIViewController{
    var myIndex = 5
    var mySecondIndex = 5
    var cellCode : [Any] = []
    var cellRun : [Any] = []
    var cellDesc : [Any] = []
    var cellCount = 0
    
    // Control what is displayed in the taps
    var tap1 = Array(repeating: false, count: 1)
    var tap2 = Array(repeating: false, count: 1)
    // Checks if the cell has a "run" output
    var NoOutput = [Bool]()
    
    var highlightr = Highlightr()
    let textStorage = CodeAttributedString()
    
    //@IBOutlet weak var const: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewCode: UITableView!
    
    override func viewDidLoad() {
        // Automatically sets the height of tableview cells
        tableViewCode.estimatedRowHeight = tableViewCode.rowHeight
        tableViewCode.estimatedRowHeight = UITableViewAutomaticDimension
        
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Code") as! [String : Any]
        //Parse of JSON
        print("in code vc")
        cellCode = subLessonData["CellCode"] as! [Any]
        cellRun = subLessonData["CellRun"] as! [Any]
        cellDesc = subLessonData["CellDesc"] as! [Any]
        
        // Sets them all to false, nothing has to be displayed in the beginning
        cellCount = cellCode.count
        tap1 = Array(repeating: false, count: cellCount)
        tap2 = Array(repeating: false, count: cellCount)
        
        // Checks what does and doesn't have an output
        for str in cellRun{
            if String(describing: str) == "No Output"{
                NoOutput.append(true)
            }
            else{
                NoOutput.append(false)
            }
        }
        
        //Syntax Highlighting
        textStorage.highlightr.setTheme(to: "solarized-dark")

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationItem.title = "Code";
    }
}



//MARK: -Extension Delegate
extension CodeVC : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        // First tap with an output
        if (tap1[myIndex] == false && tap2[myIndex] == false && NoOutput[myIndex] == false) {tap1[myIndex]=true}
        
        // First tap, no output => Jumps to second tap
        else if(tap1[myIndex] == false && tap2[myIndex] == false && NoOutput[myIndex] == true){
            tap1[myIndex]=false
            tap2[myIndex]=true
        }
        
        // Second tap, with output
        else if (tap1[myIndex] == true && tap2[myIndex] == false) {
            tap1[myIndex]=false
            tap2[myIndex]=true
        }
        
        // Third tap, goes to intital state
        else if (tap1[myIndex] == false && tap2[myIndex] == true) {tap2[myIndex]=false}
     
        // Important to have the cells resize themselves
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
}

//MARK: -Extension DataSource
extension CodeVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        myIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCode") as! CodeCell
        
        cell.code.text = cellCode[indexPath.row] as! String
        if (tap1[myIndex] == false && tap2[myIndex] == false){cell.tapLabel.text = nil
            // Hides the cells below them
            // Change to -35 for optimization
            cell.tapLabelBottomConstraint.constant = -35
        }
        
        else if (tap1[myIndex] == true && tap2[myIndex] == false){
            cell.tapLabel.text = cellRun[indexPath.row] as! String
            
            // Shows output
            cell.tapLabelBottomConstraint.constant = 0
            
            // Just UI
            cell.tapLabel.backgroundColor = UIColor.black
            cell.tapLabel.textColor = UIColor.white
            cell.tapLabel.font = UIFont(name: "Avenir Book", size: 14)
            
        }
        
        else if (tap1[myIndex] == false && tap2[myIndex] == true){
            cell.tapLabel.text = cellDesc[indexPath.row] as! String
            
            // Shows description
            cell.tapLabelBottomConstraint.constant = 0
            
            // Just UI
            cell.tapLabel.backgroundColor = UIColor(red: 13/255, green: 42/255, blue: 53/255, alpha: 1)
            cell.tapLabel.textColor = UIColor(red: 119/255, green: 135/255, blue: 138/255, alpha: 1)
            cell.tapLabel.font = UIFont(name: "American Typewriter", size: 14)
        }
        
        //Highlighting
        let highlightedCode = textStorage.highlightr.highlight(cell.code.text, as: "c++")
        
        cell.code.attributedText = highlightedCode
        cell.code.backgroundColor = textStorage.highlightr.theme.themeBackgroundColor
        
        return cell
    }
}














