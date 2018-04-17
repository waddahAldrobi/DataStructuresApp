import UIKit
import Foundation

class DataSingleton{
    
    static let shared = DataSingleton()
    
    var lessonIdentifier = 0
    var sublessonIdentifier = 0
    var lessonTitles = [String]()
    var subLessonTitles = [[String]]()
    var data: [Any] = [] // all json data
    var quizStartTime = 0.0 // time at start of quiz
    var numberCorrect = 0//number of quiz questions correct
    init(){
        print("initialized")
        // MARK: JSON Parsing
        let path = Bundle.main.path(forResource: "JSONData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            guard let lessonDataArray = json!["Content"] as? [Any] else { print("error444"); return }
            guard let lessonTitlesArray = json!["LessonTitles"] as? [Any] else { print("error444"); return }
            guard let subLessonTitlesArray = json!["SubLessonTitles"] as? [Any] else { print("error444"); return }
            //watch this for more info on JSON https://www.youtube.com/watch?v=ih20QtEVCa0
            // for info on allowed characters in json: https://stackoverflow.com/questions/2392766/multiline-strings-in-json
        
            self.data = lessonDataArray
            self.lessonTitles = lessonTitlesArray as! [String]
            self.subLessonTitles = subLessonTitlesArray as! [[String]]
        } catch {
            print(error)
        }
    }
    
    func grabSpecific(tab: String) -> Any{
        let lessonIdentifier = DataSingleton.shared.lessonIdentifier
        let subLessonIdentifier = DataSingleton.shared.sublessonIdentifier
        let subLessonData = DataSingleton.shared.data[lessonIdentifier] as? [Any]
        let subLessonData2 = subLessonData![subLessonIdentifier] as? [String : Any]
        let subLessonData3 = subLessonData2![tab]
        return(subLessonData3)!
    }

}
