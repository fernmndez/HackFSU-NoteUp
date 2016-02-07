//
//  NotesInformationViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class NotesInformationViewController: UIViewController {
    
    var noteInformation : Notes?;
    
    @IBOutlet weak var notesDateLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    
    @IBOutlet weak var notesContentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNoteInfo();
        // Do any additional setup after loading the view.
    }
    
    func loadNoteInfo(){
        self.courseNameLabel.text = self.noteInformation?.subject;
        self.notesDateLabel.text = self.noteInformation?.date;
        self.notesContentTextView.text = self.noteInformation?.notes;
        
    }

    @IBAction func navBarBackAction(sender: AnyObject) {
        
            self.performSegueWithIdentifier("navBarNoteInfoBack", sender: self)

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // segue - navBarNoteInfoBack
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
