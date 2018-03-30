import Foundation
import UIKit
import WebKit

class SummaryVC: UIViewController{
    

    @IBOutlet weak var views: CTView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Summary")
    
        let text = subLessonData as! String
        let parser = MarkupParser()
        parser.parseMarkup(text)
        (views)?.importAttrString(parser.attrString)
<<<<<<< HEAD
        
//        views.isHidden = true
//        scrollView.contentSize = views.frame.size
    // MARK - Error for waddah
//        scrollView.addSubview(views)
//        scrollView.contentSize = CGSize(width: 500, height: 900)
//        scrollView.backgroundColor = UIColor.blue
//        scrollView.isScrollEnabled = true
//        scrollView.isUserInteractionEnabled = true
=======
>>>>>>> 1cc60b01766db9a6e45f55aa279ae76cd94b3086
    }

   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationItem.title = "Summary";
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

