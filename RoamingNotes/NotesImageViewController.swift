//
//  NotesImageViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class NotesImageViewController: UIViewController {
 
    var note : Notes?;
    @IBOutlet weak var noteWebView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: note!.image);
        let requestObj = NSURLRequest(URL: url!);
        noteWebView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func navBackAction(sender: AnyObject) {
        self.performSegueWithIdentifier("NotesTableViewSegue", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
