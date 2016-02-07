//
//  ClassTableTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class ClassTableTableViewController: UITableViewController {
    
    var classes = [Class]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClasses();
    }
    
    func getUniversityNameFromAcronym(universityAcronym: String) -> String {
        switch(universityAcronym){
            case "FIU":
                return "Florida International University";

            case "FSU":
                return "Florida State University";
        default :
            return "";
        }
        
    }
    
    func loadClasses(){
        var plistPathInDocument:String = String()
        
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        
        plistPathInDocument = rootPath.stringByAppendingString("/classes.plist")
        

        var courseDictionary:Dictionary<String,AnyObject>?;
                    courseDictionary = (NSDictionary(contentsOfFile: plistPathInDocument) as! Dictionary<String, AnyObject>);
        
        
        for universities in courseDictionary! {
            for courses in courseDictionary![universities.0]! as! Dictionary<String, Array<String>> {
                //print(courses.0, "\n", courses.1[0], "\n", courses.1[1]);
                classes += [Class(courseNumber: courses.0, courseName: courses.1[1], universityName: universities.0, department: courses.1[0])]
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseID = "classTableCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseID, forIndexPath: indexPath) as! ClassTableViewCell;
        let course = classes[indexPath.row];
        cell.courseNameLabel.text = course.courseName;
        cell.courseNumberLabel.text = course.courseNumb;
        cell.courseUniversity.text = getUniversityNameFromAcronym(course.university);
        cell.courseDepartment.text = course.department;
        cell.universityImage.image = getUniversityImageFromName(course.university);
        
        return cell
    }
    
    func getUniversityImageFromName(universityName: String) -> UIImage{
        
        return UIImage(named: universityName)!;

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("ClassDetailSegue", sender: indexPath)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let row = (sender as! NSIndexPath).row; //we know that sender is an NSIndexPath here.
        let classToSend = classes[row]        
        ClassDetailViewController.currentClass = classToSend;
        if (segue.identifier == "ClassDetailSegue") {
            let controller = (segue.destinationViewController as! ClassDetailViewController)
            controller.classInformation = classToSend;
        }
    }
}
