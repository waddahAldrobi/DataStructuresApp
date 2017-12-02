import Foundation
import UIKit

class SummaryVC: UIViewController {
    var myIndex = 5
    var mySecondIndex = 5
    
    @IBOutlet weak var textfield: UILabel!
    
    override func viewDidLoad() {
        textfield.text = "\(myIndex) \(mySecondIndex)"
        
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        
        //json stuff
        let path = Bundle.main.path(forResource: "JSONData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //          print (json)
            guard let subAppArray = json as? [Any] else { print("error444"); return }
            
            //watch this for more info on JSON https://www.youtube.com/watch?v=ih20QtEVCa0
            
            guard let subAppDict = subAppArray[myIndex] as? [Any] else { return }
            guard let subAppDict1 = subAppDict[mySecondIndex] as? [String:Any] else { return }
            guard let subAppName = subAppDict1["SubApp"] as? String else {return}
            guard let lesson = subAppDict1["Lesson"] as? String else {return}
            guard let summary = subAppDict1["Summary"] as? String else {return}
            guard let code = subAppDict1["Code"] as? String else {return}
            guard let visualization = subAppDict1["Visualization"] as? [String:String] else {return}
            guard let visualizationCode = visualization["VisulizationCode"] else {return}
            
            print(subAppName)
            print (lesson)
            print (summary)
            print (code)
            print (visualizationCode)
            
            
            print("-----------------------------")
            
        } catch {
            print(error)
        }
        
    }
    
    
    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Or to rotate and lock
        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    
      //Sets title of tab
      self.tabBarController?.navigationItem.title = "Summary";
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
    
}
