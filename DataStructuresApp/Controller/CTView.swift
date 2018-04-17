import UIKit

class CTView: UIView{
    // MARK: - Properties
    var attrString: NSAttributedString!
    
    // MARK: - Internal
    func importAttrString(_ attrString: NSAttributedString) {
        self.attrString = attrString
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        // Flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height - 100)
        context.scaleBy(x: 1.0, y: -1.0)
    
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: bounds.size.width, height: 1500))

    
        let framesetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
       
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, nil)
        CTFrameDraw(frame, context)
    }
    
}

