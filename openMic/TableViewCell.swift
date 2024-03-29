//
//  TableViewCell.swift
//  openMic
//
//  Created by Garrett Spencer on 9/29/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit
import Parse

class TableViewCell: PFTableViewCell {

    //@IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    
    @IBOutlet weak var postTime: UILabel!
    
    @IBOutlet weak var numReplies: UILabel!
    
    @IBOutlet weak var numLikes: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        if (cellImage.image == nil) {
            cellImage.isHidden = true
        } else {
            cellImage.isHidden = false
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
