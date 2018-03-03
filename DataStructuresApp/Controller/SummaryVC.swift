import Foundation
import UIKit
import WebKit



class SummaryVC: UIViewController, WKNavigationDelegate{
    var myIndex = 5
    var mySecondIndex = 5
    var text = ""
    var subLessonData : String = ""


    @IBOutlet weak var summaryWebView: WKWebView!
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        insertCSSString(into: webView) // 1
    }
    
    func insertCSSString(into webView: WKWebView) {
        let cssString = "body{color:#000;background:ffffff;font-family:Helvetica}h1{color:#d11;font-family:Chalkduster;font-size:200%}ul{font-size:3vw}p{font-size:3vw}"z
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        summaryWebView.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        //This makes the title not flash DO NOT remove, should only be in default Tab
        self.tabBarController?.navigationItem.title = "Summary";
        
        
        print("in summary vc")
        print(subLessonData)
        summaryWebView.isHidden = true
        summaryWebView.navigationDelegate = self
        summaryWebView.loadHTMLString(subLessonData as String, baseURL: nil)
        // var trial = "• This is a list item! \n• This is too! " copy and paste 
    }

    // Controls orientation
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        summaryWebView.isHidden = false
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

