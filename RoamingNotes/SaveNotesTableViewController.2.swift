//
//  SaveNotesTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class SaveNotesTableViewController: UITableViewController {
    
    @IBOutlet var saveNotesTable: UITableView!
  
    var notes = [Notes]();

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Save Notes Table View Did Load");
        populateNotes();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1;
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return notes.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SaveNotesTableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SaveNotesTableViewCell;
        let note = notes[indexPath.row];
        
        cell.subjectLabel.text = note.subject;
        cell.dateLabel.text = note.date;
        
        
        return cell
    }
    

    
    func populateNotes(){
        let note1 = Notes(date: "02-05-16", subject: "ENC1101", notes: "yolo");
        
        notes += [note1];
    }
    
    
}
