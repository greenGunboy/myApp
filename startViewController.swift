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
    
    var timerCount = 60 * 5
    var timer = NSTimer()
    
    func Counting(){
        timerCount -= 1
        timeLabel.text = "\(timerCount)"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(timerCount)
        
        var filePath = NSBundle.mainBundle().pathForResource("wordsList", ofType: "plist")
        var Objects = NSDictionary(contentsOfFile: filePath!)
        var word = Objects!["words"]
        
        var oneword = Int(arc4random()) % (word!.count)!
        var twoword = Int(arc4random()) % (word!.count)!
        var threeword = Int(arc4random()) % (word!.count)!
        
        self.onewordLabel.text = (Objects!["words"]!["\(oneword)"]) as! String
        self.twowordLabel.text = (Objects!["words"]!["\(twoword)"]) as! String
        self.threewordLabel.text = (Objects!["words"]!["\(threeword)"]) as! String
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        

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
