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
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            let topColor = UIColor(red:0, green:0.78, blue:1, alpha:1)
            let midColor = UIColor(red:0, green:0.6, blue:1, alpha:1)
            let mid2Color = UIColor(red:0, green:0.5, blue:1, alpha:1)
            let mid3Color = UIColor(red:0, green:0.5, blue:1, alpha:1)
            let mid4Color = UIColor(red:0, green:0.6, blue:1, alpha:1)
            let bottomColor = UIColor(red:0, green:0.78, blue:1, alpha:1)
            
            let gradientColors: [CGColor] = [topColor.CGColor,midColor.CGColor,mid2Color.CGColor, mid3Color.CGColor, mid4Color.CGColor, bottomColor.CGColor]
            let gradientLayer: CAGradientLayer = CAGradientLayer()
            
            gradientLayer.colors = gradientColors
            gradientLayer.frame = self.view.bounds
            
            self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
            
            gradientLayer.startPoint = CGPointMake(1.0, 0.0)
            gradientLayer.endPoint = CGPointMake(0.0, 1.0)
            
            startBtn.layer.borderWidth = 9
            timeEditBtn.layer.borderWidth = 9
            ideaListBtn.layer.borderWidth = 9
            animationUseBtn.layer.borderWidth = 9
            startBtn.layer.borderColor = UIColor.whiteColor().CGColor
            startBtn.layer.masksToBounds = true
            timeEditBtn.layer.borderColor = UIColor.whiteColor().CGColor
            ideaListBtn.layer.borderColor = UIColor.whiteColor().CGColor
            animationUseBtn.layer.borderColor = UIColor.whiteColor().CGColor
            
    }
    
    override func viewWillAppear(animated: Bool) {
        
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



