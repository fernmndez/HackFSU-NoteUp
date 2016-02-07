//
//  NotesTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    // MARK: Properties
    
    var notes = [Notes]();
    var noteToPass = Notes();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes();
          self.refreshControl?.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)

    }
    func handleRefresh(refreshControl: UIRefreshControl) {
        loadNotes()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    func loadNotes(){
        notes = [Notes]();
        // Load notes from the plist
        var notesDictionary:Optional<Dictionary<String,AnyObject>>;
        
        var plistPathInDocument:String = String()
        
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        
        plistPathInDocument = rootPath.stringByAppendingString("/RoamingNotesSettings.plist")

        notesDictionary = (NSDictionary(contentsOfFile: plistPathInDocument) as! Dictionary<String, AnyObject>);
        
        
        // Get notes into a temporary variable, to parse and make note items later.
        let tmpNotes = notesDictionary!["saved-notes"] as? Array<AnyObject>;

        for key in tmpNotes! {
            notes += [Notes(date: key[1] as! String, subject: key[0] as! String, notes: key[2] as! String, image: key[3] as! String)];
        }
        
        /*

        let note1 = Notes(date: "02-05-16", subject: "ENC1101", notes: "yolo");
        let note2 = Notes(date: "02-05-16", subject: "ENC1102", notes: "yolo2");
        notes += [note1, note2];*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count;
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SaveNotesTableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SaveNotesTableViewCell;
        let note = notes[indexPath.row];
        cell.subjectLabel.text = note.subject;
        cell.dateLabel.text = note.date;
        cell.typeLabel.text = note.type;
        cell.contentLabel.text = note.notes;

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        noteToPass = notes[indexPath.row];
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(noteToPass.type == "Online Document"){
            self.performSegueWithIdentifier("NotesControllerSegue", sender: indexPath)
        } else {
            self.performSegueWithIdentifier("NotesInformationSegue", sender: indexPath)
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let row = (sender as! NSIndexPath).row; //we know that sender is an NSIndexPath here.
        let noteToSend = notes[row]
        if (segue.identifier == "NotesControllerSegue") {
            let controller = (segue.destinationViewController as! NotesImageViewController)
            
            controller.note = noteToSend
        } else if(segue.identifier == "NotesInformationSegue") {
            let controller = (segue.destinationViewController as! NotesInformationViewController)
            controller.noteInformation = noteToSend
            
        }
        
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
