//
//  startViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class startViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var onewordLabel: UILabel!
    @IBOutlet weak var twowordLabel: UILabel!
    @IBOutlet weak var threewordLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var doneBtn: UIButton!
    
    var userIdea:[NSDictionary] = []
    var timerCount = 60 * 3
    var timer = NSTimer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTextView.text = "ここにメモを書いてください"
        memoTextView.delegate = self
        memoTextView.textColor = UIColor.lightGrayColor()
        
        var filePath = NSBundle.mainBundle().pathForResource("wordsList", ofType: "plist")
        var Objects = NSDictionary(contentsOfFile: filePath!)
        var word = Objects!["words"]
        
        
        var oneword = arc4random_uniform(UInt32(word!.count))
        var twoword = arc4random_uniform(UInt32(word!.count))
        var threeword = arc4random_uniform(UInt32(word!.count))
        
        self.onewordLabel.text = (Objects!["words"]!["\(oneword)"]) as! String
        self.twowordLabel.text = (Objects!["words"]!["\(twoword)"]) as! String
        self.threewordLabel.text = (Objects!["words"]!["\(threeword)"]) as! String
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        
        if appDelegate.startFlg {
            timerCount = 60 * appDelegate.startMin + appDelegate.startSec
            appDelegate.startFlg = false
        }
    }
    
    func Counting(){
//        タイムフォーマットの指定(00:00)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm:ss"
//        １ずつ引いていく
        timerCount -= 1
//       分、秒に変換
        let mm = timerCount / 60
        let ss = timerCount % 60
        let mm_str = NSString(format: "%02d", mm)
        let ss_str = NSString(format: "%02d", ss)
        
        timeLabel.text = "\(mm_str):\(ss_str)"
        
        if timerCount == 0 {
            
            var ud = NSUserDefaults.standardUserDefaults()
            userIdea = ud.objectForKey("ideaList")! as! [NSDictionary]
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
            var now = NSDate()
            
            var time : String = dateFormatter.stringFromDate(now)
            var one : String = onewordLabel.text!
            var two : String = twowordLabel.text!
            var three : String = threewordLabel.text!
            var memo : String = memoTextView.text!
            
            var ideaInfo: NSDictionary = ["time":time,"one":one,"two":two,"three":three,"memo":memo]
            
            userIdea.append(ideaInfo)
            
            ud.setObject(userIdea, forKey: "ideaList")
            
            ud.synchronize()
            
        let alertController = UIAlertController(title: "Time Up", message: "Idea Listへ保存しました", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.move()}))
            presentViewController(alertController, animated: true, completion: nil)
            
            timer.invalidate()
        }
    }
    
    func move() {
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("viewController")
        self.presentViewController(targetView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func doneBtn(sender: UIButton) {
        
        var ud = NSUserDefaults.standardUserDefaults()
        
        if ud.objectForKey("ideaList") != nil {
            userIdea = ud.objectForKey("ideaList")! as! [NSDictionary]
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        var now = NSDate()
        var time : String = dateFormatter.stringFromDate(now)
        var one : String = onewordLabel.text!
        var two : String = twowordLabel.text!
        var three : String = threewordLabel.text!
        var memo : String = ""
        if memoTextView.text == "ここにメモを書いてください"{
            memo = ""
        }else{
            memo = memoTextView.text!
        }
        var ideaInfo: NSDictionary = ["time":time,"one":one,"two":two,"three":three,"memo":memo]
        userIdea.append(ideaInfo)
        
        ud.setObject(userIdea, forKey: "ideaList")
        ud.synchronize()
    }
    
    func textViewDidBeginEditing(memoTextView: UITextView) {
        if memoTextView.textColor == UIColor.lightGrayColor() {
            memoTextView.text = nil
            memoTextView.textColor = UIColor.blackColor()
        }
    }
    func textViewDidEndEditing(memoTextView: UITextView) {
        if memoTextView.text.isEmpty {
            memoTextView.text = "ここにメモを書いてください"
            memoTextView.textColor = UIColor.lightGrayColor()
        }
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
