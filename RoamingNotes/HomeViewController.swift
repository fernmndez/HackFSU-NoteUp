//
//  FirstViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/6/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        preparePlistForUse();
    
    
    }
    func preparePlistForUse(){
        
        var plistPathInDocument:String = String()

        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]

        plistPathInDocument = rootPath.stringByAppendingString("/RoamingNotesSettings.plist")
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument){
            let plistPathInBundle = NSBundle.mainBundle().pathForResource("RoamingNotesSettings", ofType: "plist") as String!
   
            do {
                try NSFileManager.defaultManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument)
            }catch{
                print("Error occurred while copying file to document \(error)")
            }
        }
        plistPathInDocument = rootPath.stringByAppendingString("/classes.plist")
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument){
            let plistPathInBundle = NSBundle.mainBundle().pathForResource("classes", ofType: "plist") as String!
            
            do {
                try NSFileManager.defaultManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument)
            }catch{
                print("Error occurred while copying file to document \(error)")
            }
        }
        plistPathInDocument = rootPath.stringByAppendingString("/ClassNotes.plist")
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument){
            let plistPathInBundle = NSBundle.mainBundle().pathForResource("ClassNotes", ofType: "plist") as String!
            
            do {
                try NSFileManager.defaultManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument)
            }catch{
                print("Error occurred while copying file to document \(error)")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

