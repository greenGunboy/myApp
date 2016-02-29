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
    @IBOutlet weak var animationStart: SpringButton!
    @IBOutlet weak var animationTimeBtn: SpringButton!
    @IBOutlet weak var animationUseBtn: SpringButton!
    @IBOutlet weak var animationIdeaBtn: SpringButton!
    @IBOutlet weak var aView: UILabel!
    
    var myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            startBtn.layer.borderWidth = 10
            timeEditBtn.layer.borderWidth = 10
            ideaListBtn.layer.borderWidth = 10
            animationUseBtn.layer.borderWidth = 10
            startBtn.layer.borderColor = UIColor.whiteColor().CGColor
            timeEditBtn.layer.borderColor = UIColor.whiteColor().CGColor
            ideaListBtn.layer.borderColor = UIColor.whiteColor().CGColor
            animationUseBtn.layer.borderColor = UIColor.whiteColor().CGColor
            
//            let gLayer = CAGradientLayer()
//            gLayer.frame = self.view.frame
//            gLayer.colors = [UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor]
//            self.view.layer.insertSublayer(gLayer, atIndex: 0)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let moveToCenter = CABasicAnimation(keyPath: "position.y")
        moveToCenter.fromValue = 100.0
        moveToCenter.toValue = myBoundSize.height/2
        moveToCenter.duration = 0.8
        
        self.aView.layer.addAnimation(moveToCenter, forKey: nil)
        
        UIView.animateWithDuration(0.5, animations: {
            self.aView.alpha = 1
            }, completion: nil)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func startButton(sender: UIButton) {
        animationStart.animation = "squeeze"
        animationStart.animate()
        }
    
    @IBAction func animaTime(sender: SpringButton) {
        animationTimeBtn.animation = "squeeze"
        animationTimeBtn.animate()
    }
    
    @IBAction func animaIdea(sender: SpringButton) {
        animationIdeaBtn.animation = "squeeze"
        animationIdeaBtn.animate()
    }
    
    @IBAction func animaUse(sender: SpringButton) {
        animationUseBtn.animation = "squeeze"
        animationUseBtn.animate()
    }
    
    }



