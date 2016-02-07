//
//  Class.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import Foundation

class Class {
    var courseNumb: String;
    var courseName: String;
    var university: String;
    var department: String;
    
    init (courseNumber: String, courseName: String, universityName: String, department: String){
        self.courseNumb = courseNumber;
        self.courseName = courseName;
        self.university = universityName;
        self.department = department;
    }
    
    
}