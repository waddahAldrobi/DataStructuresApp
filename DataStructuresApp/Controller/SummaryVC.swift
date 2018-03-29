import Foundation
import UIKit
import WebKit

class SummaryVC: UIViewController{
    

    @IBOutlet weak var views: CTView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
//        views.frame.size.height = 1000
        scrollView.contentSize.height = 2000
//        scrollView.size
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Summary")
    
        let text = subLessonData as! String
        let parser = MarkupParser()
        parser.parseMarkup(text)
        (views)?.importAttrString(parser.attrString)
    }

   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationItem.title = "Summary";
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

