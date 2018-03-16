//
//  CodeCell.swift
//  DataStructuresApp
//
//  Created by Waddah Aldrobi on 2018-02-18.
//  Copyright © 2018 Waddah Aldrobi. All rights reserved.
//

import Foundation
import UIKit

class CodeCell : UITableViewCell, UITableViewDelegate{
//    @IBOutlet weak var code: UITextView!
//    @IBOutlet weak var tapLabel: UITextView!
    
    //@IBOutlet weak var code: UILabel!
    //@IBOutlet weak var tapLabel: UILabel!
    @IBOutlet weak var code: UITextView!
    
    @IBOutlet weak var tapLabel: UITextView!
    
    @IBOutlet weak var tapLabelBottomConstraint: NSLayoutConstraint!
}
