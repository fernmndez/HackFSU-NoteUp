//
//  ClassNotesTableViewCell.swift
//  RoamingNotes
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit;

class ClassNotesTableViewCell: UITableViewCell {

    @IBOutlet weak var notesTitle: UILabel!
    @IBOutlet weak var notesDate: UILabel!    
    @IBOutlet weak var notesCost: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
