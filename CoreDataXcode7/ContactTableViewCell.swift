//
//  ContactTableViewCell.swift
//  CoreDataXcode7
//
//  Created by Yung Dai on 2015-09-09.
//  Copyright © 2015 Yung Dai. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabelText: UILabel!
    @IBOutlet weak var addressLabelText: UILabel!
    @IBOutlet weak var phoneNumberLabelText: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
