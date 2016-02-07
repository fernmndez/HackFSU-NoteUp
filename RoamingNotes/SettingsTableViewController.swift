//
//  SettingsTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel:       UILabel!
    @IBOutlet weak var majorLabel:      UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var emailLabel:      UILabel!
    @IBOutlet weak var memberSinceLabel: UILabel!
    @IBOutlet weak var soundLabel: UIButton!
    
    @IBOutlet weak var creditsLabel:    UILabel!
    @IBOutlet weak var uploadsLabel:    UILabel!
    @IBOutlet weak var likesLabel:      UILabel!
    
    
    @IBOutlet weak var pushToggle:      UISwitch!
    @IBOutlet weak var cellToggle:      UISwitch!
    
    var userSettings:   Optional<Dictionary<String, AnyObject>>;
    var userStats:   Optional<Dictionary<String, AnyObject>>;
    var appSettings:    Optional<Dictionary<String, AnyObject>>;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Settings View Did Load");
        
        getSettings();
        populateInformation();
        
    }
    @IBAction func editInfoAction(sender: AnyObject) {
        let actionSheetController = UIAlertController(title: "Edit Info Disabled", message: "Editing Information is disabled in the demo for HackFSU", preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func uploadImageAction(sender: AnyObject) {
        let actionSheetController = UIAlertController(title: "Image Upload Disabled", message: "Uploading images is disabled in the demo for HackFSU", preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func logoutButtonAction(sender: AnyObject) {
        let actionSheetController = UIAlertController(title: "Logout Disabled", message: "Logout is disabled in the demo for HackFSU", preferredStyle: .Alert)
        
        
       //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelAction)

        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    func populateInformation(){
        // Populate the information on settings page with the settings we loaded from plist
        if(userSettings != nil && userStats != nil && appSettings != nil){
            nameLabel.text          = userSettings!["name"] as? String;
            majorLabel.text         = userSettings!["major"] as? String;
            universityLabel.text    = userSettings!["university"] as? String;
            emailLabel.text         = userSettings!["email"] as? String;
            memberSinceLabel.text   = userSettings!["member-since"] as? String;
            
            creditsLabel.text       = userStats!["credits"] as? String;
            uploadsLabel.text       = userStats!["uploads"] as? String;
            likesLabel.text         = userStats!["likes"] as? String;
            
            soundLabel.titleLabel?.text         = appSettings!["sound"] as? String;
            pushToggle.on           = (appSettings!["push"] as? Bool)!;
            cellToggle.on           = (appSettings!["cellular"] as? Bool)!;
            
            let url = NSURL(string: (userSettings!["image"] as? String)!)
            let data = NSData(contentsOfURL: url!)
            profileImageView.image = UIImage(data: data!)
            
            print("Populated information", nameLabel.text);
            
            
        } else {
            print("Fatal error loading settings");
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getSettings() {
        // Load settings and user info from the plist
        var plistPathInDocument:String = String()
        
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        
        plistPathInDocument = rootPath.stringByAppendingString("/RoamingNotesSettings.plist")
        
        var settingsDictionary:Dictionary<String,AnyObject>?;
        let path = plistPathInDocument
            settingsDictionary = (NSDictionary(contentsOfFile: path) as! Dictionary<String, AnyObject>);
        
        userSettings = settingsDictionary!["user"] as? Dictionary<String, AnyObject>;
        userStats = userSettings!["stats"] as? Dictionary<String, AnyObject>;
        appSettings = settingsDictionary!["settings"] as? Dictionary<String, AnyObject>;


    }
    
    //TODO: Implement disabling of cellular data downloading when this is changed
    @IBAction func toggleCellularData(sender: UISwitch) {
        
        print("use cellular data has been set to ", sender.on);
    }
    
    @IBAction func togglePushNotification(sender: UISwitch) {
        
        let pushNotifications = sender.on;

        if(!pushNotifications){
            let actionSheetController = UIAlertController(title: "Push Notification Disable", message: "Are you sure you want to disable push notifications?", preferredStyle: .Alert)

            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
                sender.on = true;
            }
            actionSheetController.addAction(cancelAction)
            //Create and an option action
            let nextAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
                
            }
            actionSheetController.addAction(nextAction)
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }
    }

    
}
