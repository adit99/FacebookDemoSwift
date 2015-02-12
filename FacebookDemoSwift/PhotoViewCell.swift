//
//  PhotoViewCell.swift
//  FacebookDemoSwift
//
//  Created by Aditya Jayaraman on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
