import Foundation
import UIKit
import Highlightr

class VisualizationVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var highlightr = Highlightr()
    let textStorage = CodeAttributedString()
    var contentWidth:CGFloat = 0.0
    var images = [String]()
    
    override func viewDidLoad() {
        let subLessonData = DataSingleton.shared.grabSpecific(tab: "Visualization") as! [String: Any]
        images = subLessonData["Images"] as! [String]

        //scrollview
        pageControl.numberOfPages = 0
        scrollView.delegate = self
        for image in images {
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(images.index(of: image)!)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            if (((imageToDisplay?.size.height)! / (imageToDisplay?.size.width)!)*view.frame.width) < view.frame.height{ // decide whether to scale to height or width of screen
                imageView.frame = CGRect(x: xCoordinate - (view.frame.width/2), y: (scrollView.frame.height / 2) - (view.frame.width/2), width: view.frame.width , height: ((imageToDisplay?.size.height)! / (imageToDisplay?.size.width)!)*view.frame.width)
            } else {
                imageView.frame = CGRect(x: xCoordinate - (view.frame.width/2), y: (scrollView.frame.height / 2) - (view.frame.width/2), width: ((imageToDisplay?.size.width)! / (imageToDisplay?.size.height)!)*view.frame.height, height: view.frame.height)
            }
            pageControl.numberOfPages += 1
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height-150)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            
        } else if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = view.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(width))
        scrollView.contentOffset.y = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
//        AppUtility.lockOrientation(.landscape , andRotateTo: .landscapeRight)
        
        //Sets title of tab
          self.tabBarController?.navigationItem.title = "Visualization";
    }
    
    
    // Controls orientation
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
//        AppUtility.lockOrientation(.portrait)
    }
   }
