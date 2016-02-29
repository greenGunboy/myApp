//
//  listViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class listViewController: UIViewController {
    
    
    @IBOutlet weak var listTimeLabel: UILabel!
    @IBOutlet weak var listOneLabel: UILabel!
    @IBOutlet weak var listTwoLabel: UILabel!
    @IBOutlet weak var listThreeLabel: UILabel!
    @IBOutlet weak var listMemoText: UITextView!
    
    var scSeletedIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOneLabel.layer.borderWidth = 8
        listTwoLabel.layer.borderWidth = 8
        listThreeLabel.layer.borderWidth = 8
        listOneLabel.layer.borderColor = UIColor.whiteColor().CGColor
        listTwoLabel.layer.borderColor = UIColor.whiteColor().CGColor
        listThreeLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        print(scSeletedIndex)
        
        var ud = NSUserDefaults.standardUserDefaults()
        var udResult:NSArray = ud.objectForKey("ideaList") as! NSArray
        self.listTimeLabel.text = udResult[scSeletedIndex]["time"] as! String
        self.listOneLabel.text = udResult[scSeletedIndex]["one"] as! String
        self.listTwoLabel.text = udResult[scSeletedIndex]["two"] as! String
        self.listThreeLabel.text = udResult[scSeletedIndex]["three"] as! String
        listMemoText.text = "\(udResult[scSeletedIndex]["memo"] as! String)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func backSwipe(sender: UISwipeGestureRecognizer) {
        
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("tableList")
        targetView.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(targetView, animated: true, completion: nil)

        
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
