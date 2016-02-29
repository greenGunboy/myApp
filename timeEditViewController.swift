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
    @IBOutlet weak var animeBtn: SpringButton!
    @IBOutlet weak var myMinTimePicker: UIPickerView!
    @IBOutlet weak var mySecTimePicker: UIPickerView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    var userDecideMinTime = ""
    var userDecideSecTime = ""
    var min = 0
    var sec = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animeBtn.layer.borderWidth = 10
        animeBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
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
        
        if pickerView.tag == 1 {
            min = row
        }
        
        if pickerView.tag == 2{
            sec = row
        }
        
    }
  
    
    @IBAction func changeBtn(sender: AnyObject) {
        animeBtn.animation = "squeeze"
        animeBtn.animate()
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.startMin = min
        appDelegate.startSec = sec
        appDelegate.startFlg = true

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
