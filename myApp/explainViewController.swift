//
//  explainViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/03/01.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class explainViewController: UIViewController, UIScrollViewDelegate {
    
    let slides = [
        ["text": "このアプリは\nあなたの創造性を\n助けます"],
        ["text": "ランダムで表示される\nワードを組み合わせて\n\n新しいモノを\n生み出しましょう"],
        ["text": "例) 音楽 + 電話 + カメラ\n= iPhone\n\n　デバイス + メガネ\n= 視力検査アプリ"],
        ["text": "Settingで\n\n制限時間の設定、\n\nワードの追加が出来ます"],
        ["text": "Let's Try!\n\nあなたのアイディアで\n世界を変えよう！"],
    ]
    
    let screen: CGRect = UIScreen.mainScreen().bounds
    var scroll: UIScrollView?
    var dots: UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let midColor = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let mid2Color = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let mid3Color = UIColor(red:0, green:0.60, blue:1, alpha:1)
        let mid4Color = UIColor(red:0, green:0.66, blue:1, alpha:1)
        let bottomColor = UIColor(red:0, green:0.95, blue:1, alpha:1)
        
        let gradientColors: [CGColor] = [topColor.CGColor,midColor.CGColor,mid2Color.CGColor, mid3Color.CGColor, mid4Color.CGColor, bottomColor.CGColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        scroll = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screen.width, height: screen.height))
        scroll?.alpha = 0
        scroll?.showsHorizontalScrollIndicator = false
        scroll?.showsVerticalScrollIndicator = false
        scroll?.pagingEnabled = true
        view.addSubview(scroll!)
        
        if (slides.count > 1) {
            dots = UIPageControl(frame: CGRect(x: 0.0, y: screen.height * 0.875, width: screen.width, height: screen.height * 0.05))
            dots?.numberOfPages = slides.count
            view.addSubview(dots!)
        }
        
        for var i = 0; i < slides.count; ++i {
            
            if let text = slides[i]["text"] {
                let textView = UITextView(frame: CGRect(x: screen.width * 0.05 + CGFloat(i) * screen.width, y: screen.height / 2 - 120, width: screen.width * 0.9, height: 250.0))
                textView.text = text
                textView.textAlignment = NSTextAlignment.Center
                textView.font = UIFont.systemFontOfSize(28, weight: 0)
                textView.textColor = UIColor.whiteColor()
                textView.backgroundColor = UIColor.clearColor()
                textView.alpha = 1
                textView.tag = i
                let moveToCenter = CABasicAnimation(keyPath: "position.y")
                moveToCenter.fromValue = -150.0
                moveToCenter.toValue = screen.height/2
                moveToCenter.duration = 0.8
                
                textView.layer.addAnimation(moveToCenter, forKey: nil)
                
                textView.editable = false
                textView.selectable = false
                scroll?.addSubview(textView)
            }
            
        }
        
        scroll?.contentSize = CGSizeMake(CGFloat(Int(screen.width) *  slides.count), screen.height * 0.5)
        scroll?.delegate = self
        dots?.addTarget(self, action: Selector("swipe:"), forControlEvents: UIControlEvents.ValueChanged)
        let closeButton = UIButton()
        closeButton.frame = CGRect(x: screen.width / 25, y: 20, width: 60, height: 60)
        closeButton.setTitle("Back", forState: .Normal)
        closeButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5), forState: .Normal)
        closeButton.titleLabel!.font =  UIFont.systemFontOfSize(20)
        closeButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        view.addSubview(closeButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIScrollView.animateWithDuration(0.4, animations: {
            self.scroll?.alpha = 1
            }, completion: nil)
        
    }
    
    func pressed(sender: UIButton!) {
        self.dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFrame (iW: CGFloat, iH: CGFloat, slide: Int, offset: CGFloat) -> CGRect {
        let mH: CGFloat = screen.height * 0.50
        let mW: CGFloat = screen.width
        var h: CGFloat
        var w: CGFloat
        let r = iW / iH
        if (r <= 1) {
            h = min(mH, iH)
            w = h * r
        } else {
            w = min(mW, iW)
            h = w / r
        }
        return CGRectMake(
            max(0, (mW - w) / 2) + CGFloat(slide) * screen.width,
            max(0, (mH - h) / 2) + offset,
            w,
            h
        )
    }
    
    func swipe(sender: AnyObject) -> () {
        
        if let scrollView = scroll {
            
            let x = CGFloat(dots!.currentPage) * scrollView.frame.size.width
            scroll?.setContentOffset(CGPointMake(x, 0), animated: true)
            
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) -> () {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        dots!.currentPage = Int(pageNumber)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
