//
//  ClassNoteListingTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class ClassNoteListingTableViewController: UITableViewController {

    var classInformation : Class?;
    var notesForClass : [ClassNotes] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesForClass = [ClassNotes]();
        classInformation = ClassDetailViewController.currentClass;
        loadNotesForClass();
    }
    func loadNotesForClass(){
        var plistPathInDocument:String = String()
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        plistPathInDocument = rootPath.stringByAppendingString("/ClassNotes.plist")
        
        var nfClass:Dictionary<String,AnyObject>?;

        nfClass = (NSDictionary(contentsOfFile: plistPathInDocument) as! Dictionary<String, AnyObject>);
        
        for classes in nfClass! as! Dictionary<String, Array<String>> {
            print(classInformation!.courseNumb);
            print(classes.0);
            if (classInformation!.courseNumb == classes.0) {
                notesForClass += [ClassNotes(notesDate: classes.0, notesTitle: classes.1[0], classCost: classes.1[1])]
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
        return notesForClass.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let reuseID = "ClassNotesCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseID, forIndexPath: indexPath) as! ClassNotesTableViewCell;
        
       let notes = notesForClass[indexPath.row];
        
        cell.notesTitle.text                = notes.notesTitle;
        cell.notesDate.text                 = notes.notesDate;
        cell.notesCost.setTitle(notes.classCost, forState: UIControlState.Normal);
        
        
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
