//
//  timeEditViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class timeEditViewController: UIViewController {
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        let df = NSDateFormatter()
        df.dateFormat = "mm:ss"
        myDatePicker.date = df.dateFromString("05:00")!
        myDatePicker.maximumDate = df.dateFromString("10:00")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
