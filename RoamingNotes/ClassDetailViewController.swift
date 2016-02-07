//
//  ClassDetailViewController.swift
//  RoamingNotes
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 FIU. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

    @IBOutlet weak var courseNumberLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var universityLogo: UIImageView!
    
    static var currentClass : Class?;
    
    var classInformation : Class?;
    
    @IBOutlet weak var detailTableView: UIView!

    override func viewDidLoad() {
        universityLogo.image = UIImage(named: classInformation!.university);
        courseNumberLabel.text = classInformation!.courseNumb
        courseNameLabel.text = classInformation!.courseName
        universityLabel.text = classInformation!.university
        departmentLabel.text = classInformation!.department
        super.viewDidLoad();
        // Do any additional setup after loading the view.
    }

    @IBAction func navBarBackAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("classDetailsBackNavBar", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
