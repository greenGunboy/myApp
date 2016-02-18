//
//  ViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var timeEditBtn: UIButton!
    @IBOutlet weak var ideaListBtn: UIButton!
    
    var userDecideTime = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(userDecideTime)
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    戻り
//    @IBAction func returnMenu(segue: UIStoryboardSegue){
//        let newVC = segue.sourceViewController as! timeEditViewController
//        userDecideTime = newVC.sendUserDecideTime
//        print(userDecideTime)
//        
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "myStartSegue"){
            var newVC = segue.destinationViewController as! UITabBarController
            
            var startViewController = newVC.viewControllers![1]
            
//            var startvc:startViewController = startViewController
//            
//            startViewController.timerCount = userDecideTime
            
        }
  }
}
