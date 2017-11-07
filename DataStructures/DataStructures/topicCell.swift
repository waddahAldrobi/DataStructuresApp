//
//  topicCell.swift
//  DataStructures
//
//  Created by Skimmy Chan on 2017-11-06.
//  Copyright © 2017 Ethan. All rights reserved.
//

import Foundation
import UIKit

class topicCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Topic) {
        
        title.text = item.title
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
        
    }
    
}
