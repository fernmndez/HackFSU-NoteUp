//
//  Notes.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import Foundation

class Notes {
    var date: String;
    var subject: String;
    var notes: String;
    var image: String;
    var type: String;
    
    init(){
        self.date = ""
        self.subject = ""
        self.notes = ""
        self.image = ""
        self.type = ""
    }
    convenience init(date: String, subject: String, notes: String){
        self.init();
        self.date = date;
        self.subject = subject;
        self.notes = notes;
        self.image = "";
        self.type = "Typed";
    }
    
    convenience init(date: String, subject: String, notes: String, image: String){
        self.init(date: date, subject: subject, notes: notes);
        
        if (image != "") {
            self.notes = "Click to view document";
            self.image = image;
            self.type = "Online Document";
        }
    }
}