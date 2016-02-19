//
//  timeEditViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class timeEditViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var decideBtn: UIButton!
    @IBOutlet weak var myMinTimePicker: UIPickerView!
    @IBOutlet weak var mySecTimePicker: UIPickerView!
    
    var sendUserDecideTime = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        myMinTimePicker.dataSource = self
        myMinTimePicker.delegate = self
        mySecTimePicker.dataSource = self
        mySecTimePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        myMinTimePicker.tag
        
        print("\(row)")
        print(mySecTimePicker)
    }
    
  
    
    @IBAction func changeBtn(sender: AnyObject) {
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        myDatePicker.datePickerMode = UIDatePickerMode.CountDownTimer
//        let df = NSDateFormatter()
//        df.dateFormat = "mm:ss"
//        var dateStr = df.stringFromDate(myDatePicker.date)
//        var sendUserDecideTime = dateStr
//        print(sendUserDecideTime)
//        var newVC = segue.destinationViewController as! ViewController
//        newVC.userDecideTime = sendUserDecideTime
//        
//        }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
