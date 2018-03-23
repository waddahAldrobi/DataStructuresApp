import Foundation
import UIKit
import WebKit

class SummaryVC: UIViewController, UIWebViewDelegate{
    @IBOutlet weak var summaryWebView: UIWebView!

    override func viewDidLoad() {
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Summary")
        
        summaryWebView.isHidden = true
        summaryWebView.delegate = self
        summaryWebView.loadHTMLString(subLessonData as! String, baseURL: nil)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        let cssString = "body{color:#000;background:ffffff;font-family:American Typewriter}h1{color:#19BCFF;font-family:American Typewriter;font-size:200%}ul{font-size:2vw}p{font-size:2vw}"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        _ = summaryWebView.stringByEvaluatingJavaScript(from: jsString)
    }
    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        summaryWebView.isHidden = false
    // Or to rotate and lock
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portraitUpsideDown)
//        AppUtility.lockOrientation(.portrait , andRotateTo: .portrait)
    
      //Sets title of tab
      self.tabBarController?.navigationItem.title = "Summary";
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    // Don't forget to reset when view is being removed
//        AppUtility.lockOrientation(.portrait)
    }
}

