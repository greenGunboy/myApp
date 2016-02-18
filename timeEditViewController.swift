//
//  timeEditViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class timeEditViewController: UIViewController {
    
    
    @IBOutlet weak var decideBtn: UIButton!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    var sendUserDecideTime = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
//        
//        myDatePicker.datePickerMode = UIDatePickerMode.CountDownTimer
//        let df = NSDateFormatter()
//        df.dateFormat = "mm:ss"
//        var dateStr = df.stringFromDate(myDatePicker.date)
//        print(dateStr)
//        var sendUserDecideTime = dateStr
//        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  
    
    @IBAction func changeBtn(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        myDatePicker.datePickerMode = UIDatePickerMode.CountDownTimer
        let df = NSDateFormatter()
        df.dateFormat = "mm:ss"
        var dateStr = df.stringFromDate(myDatePicker.date)
        var sendUserDecideTime = dateStr
        print(sendUserDecideTime)
        var newVC = segue.destinationViewController as! ViewController
        newVC.userDecideTime = sendUserDecideTime
        
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
