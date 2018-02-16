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
        let cssString = "body{color:#000;background:ffffff;font-family:Helvetica}p{font-size:36pt}h1{color:#d11;font-family:Chalkduster;font-size:36pt}a{font-family:Helvetica;font-weight:700;color:#ffa;text-decoration:none;padding-left:5px}img{padding-left:0;max-width:90%;max-height:90%;box-shadow:3px 3px 3px 0 #202020}.navbar{background-color:#000;color:#fff;position:absolute;top:0;left:0;width:100%}.content{padding-left:1em;padding-top:1em}"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        summaryWebView.evaluateJavaScript(jsString, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        
//        "\(myIndex) \(mySecondIndex)"
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

