//
//  memoViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/19.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class memoViewController: UIViewController {
    
    
    @IBOutlet weak var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        memoTextView.editable = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func closeBtn(sender: AnyObject) {
        
//        var ud = NSUserDefaults.standardUserDefaults()
//        ud.setObject("\(memoTextView.text)", forKey: "memo")
//        var udMemo: AnyObject! = ud.objectForKey("memo")
//        
//        memoTextView.resignFirstResponder()
        
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
