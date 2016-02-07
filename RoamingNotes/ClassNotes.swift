//
//  ClassNotes.swift
//  RoamingNotes
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import Foundation

class ClassNotes {
    var notesTitle: String;
    var notesDate: String;
    var classCost: String;
    
    init(notesDate: String, notesTitle : String, classCost: String ){
        self.notesDate = notesDate;
        self.notesTitle = notesTitle;
        self.classCost = classCost;
    }
}