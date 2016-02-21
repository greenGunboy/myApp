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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @IBAction func startButton(sender: UIButton) {
        
        var targetView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier( "welcome" )
        self.presentViewController( targetView as! UIViewController, animated: true, completion: nil)
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
//        var newVC = segue.destinationViewController as! startViewController
//        newVC.startMin = minitesTime
//        newVC.startSec = secondTime
//    
//    }
    
    
    }
