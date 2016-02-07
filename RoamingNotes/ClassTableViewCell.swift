//
//  ClassTableViewCell.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    
    @IBOutlet weak var courseNumberLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseUniversity: UILabel!
    @IBOutlet weak var courseDepartment: UILabel!
    @IBOutlet weak var universityImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
