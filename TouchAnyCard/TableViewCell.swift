//
//  TableViewCell.swift
//  TouchAnyCard
//
//  Created by Andrew Gorzny on 2018-06-27.
//  Copyright © 2018 Andrew Gorzny. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var labelBottomLeft: UILabel!
    @IBOutlet weak var labelBottomRight: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.labelBottomLeft.isHidden = true
        self.labelBottomRight.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
