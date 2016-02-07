//
//  UploadTableViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import MobileCoreServices
import UIKit

class UploadTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var universityTextInput: UITextField!
    @IBOutlet weak var courseNumberTextInput: UITextField!
    @IBOutlet weak var textOnlySwitch: UISwitch!
    @IBOutlet var uploadImageView: UIImageView!
    
    @IBOutlet weak var uploadTextView: UITextView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    @IBAction func textSubmissionToggle(sender: UISwitch) {
        
        if(sender.on){
            uploadTextView.hidden = false;
            uploadImageView.hidden = true;
            uploadButton.hidden = true;
        } else {
            uploadTextView.hidden = true;
            uploadImageView.hidden = false;
            uploadButton.hidden = false;
        }
    }
    @IBAction func selectPhotoButton(sender: UIButton) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    func errorFillOutAllFields(){
        let actionSheetController = UIAlertController(title: "Fill out fields", message: "Please fill out all the fields before submitting!", preferredStyle: .Alert)
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    func errorBadUniversity(){
        let actionSheetController = UIAlertController(title: "Bad University", message: "Only FIU and FSU can be submitted at this time!", preferredStyle: .Alert)
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func submitUploadButton(sender: AnyObject) {
        var plistPathInDocument:String = String()
        
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        
        plistPathInDocument = rootPath.stringByAppendingString("/RoamingNotesSettings.plist")

        
        var settingsDictionary:NSMutableDictionary?;
                    settingsDictionary = (NSMutableDictionary(contentsOfFile: plistPathInDocument));
        
        let listOfSavedNoted = settingsDictionary!["saved-notes"]! as! NSMutableArray;
        
        let formatter = NSDateFormatter();

        formatter.dateFormat = "MM-dd-yy"
        let date = formatter.stringFromDate(NSDate());
        if courseNumberTextInput.text == "" {
            errorFillOutAllFields();
            return;
        }
        if !(universityTextInput.text == "FIU" || universityTextInput.text == "FSU") {
            errorBadUniversity();
            return;
        }
        if (textOnlySwitch.on){
            
            let noteToSave = NSArray(array: ([courseNumberTextInput.text!, date, uploadTextView.text, ""]) as Array<String>);
            listOfSavedNoted.insertObject(noteToSave, atIndex: listOfSavedNoted.count)
            settingsDictionary?.setValue(listOfSavedNoted, forKey: "saved-notes")
            
            settingsDictionary?.writeToFile(plistPathInDocument, atomically: true)
            print(settingsDictionary);
            
        } else {
            var rng = rand() % 1000;
            var inputName = ((courseNumberTextInput.text)! + "." + date + "." + rng.description ).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
            inputName = inputName.stringByReplacingOccurrencesOfString(" ", withString: "")
            
            var imagePathInDocument:String = String()
            let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
                        imagePathInDocument = rootPath.stringByAppendingString("/" + courseNumberTextInput.text! + ".png")

            let noteToSave = NSArray(array: ([courseNumberTextInput.text!, date, "", imagePathInDocument]) as Array<String>);
            listOfSavedNoted.insertObject(noteToSave, atIndex: listOfSavedNoted.count)
            settingsDictionary?.setValue(listOfSavedNoted, forKey: "saved-notes")
            
            settingsDictionary?.writeToFile(plistPathInDocument, atomically: true)
            print(settingsDictionary);
            
            UIImagePNGRepresentation(uploadImageView.image!)?.writeToFile(imagePathInDocument, atomically: true);
            // Save image.

        }
        
        
    }
    
    
    @objc func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            print("Button capture")
        }
        
    
        print("Image picked");
        if let pickedImage = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage {
            uploadImageView.contentMode = .ScaleAspectFit
            uploadImageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
         imagePicker.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
