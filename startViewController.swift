//
//  startViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class startViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var onewordLabel: UILabel!
    @IBOutlet weak var twowordLabel: UILabel!
    @IBOutlet weak var threewordLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var timerCount = 60 * 3
    var timer = NSTimer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var filePath = NSBundle.mainBundle().pathForResource("wordsList", ofType: "plist")
        var Objects = NSDictionary(contentsOfFile: filePath!)
        var word = Objects!["words"]
        
        var oneword = Int(arc4random()) % (word!.count)!
        var twoword = Int(arc4random()) % (word!.count)!
        var threeword = Int(arc4random()) % (word!.count)!
        
        self.onewordLabel.text = (Objects!["words"]!["\(oneword)"]) as! String
        self.twowordLabel.text = (Objects!["words"]!["\(twoword)"]) as! String
        self.threewordLabel.text = (Objects!["words"]!["\(threeword)"]) as! String
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
    
        if appDelegate.startFlg {
            timerCount = 60 * appDelegate.startMin + appDelegate.startSec
            appDelegate.startFlg = false
        }
        
    }

    
    func Counting(){
        timerCount -= 1
        timeLabel.text = "\(timerCount)"
        if timerCount == 0 {
        let alertController = UIAlertController(title: "Time Up", message: "Idea Listへ保存しました", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: /* tableView or ViewControllerへ */nil))
            presentViewController(alertController, animated: true, completion: nil)
            timer.invalidate()
        }
    }
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func completeBtn(sender: UIButton) {
        
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
