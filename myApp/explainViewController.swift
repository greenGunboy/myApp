//
//  explainViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/03/01.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class explainViewController: UIViewController, UIScrollViewDelegate {
    
    var myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    
    let slides = [
        ["text":"aaa"],
        ["text":"bbb"],
        ["text":"cccc"]
    ]
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var dots: UIPageControl!
    @IBOutlet weak var aView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let pageSize = 3
        
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.pagingEnabled = true
        scroll.delegate = self
        self.view.addSubview(scroll)
        
        for var i = 0; i < pageSize; i++ {
            
            // ページごとに異なるラベルを生成する.
//            aView = UILabel(frame: CGRectMake(CGFloat(i) * width + width/2 - 40, height/2 - 40, 80, 80))
            aView.layer.masksToBounds = true
            aView.text = "Page\(i)"
            
            scroll.addSubview(aView)
        }
        
        dots.numberOfPages = pageSize
        dots.currentPage = 0
        dots.userInteractionEnabled = false
        
        self.view.addSubview(dots)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
//        let moveToCenter = CABasicAnimation(keyPath: "position.y")
//        moveToCenter.fromValue = -150.0
//        moveToCenter.toValue = myBoundSize.height/2
//        moveToCenter.duration = 0.8
//        
//        self.aView.layer.addAnimation(moveToCenter, forKey: nil)
        
//        UIView.animateWithDuration(1.5, animations: {
//            self.aView.alpha = 1
//            }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scroll: UIScrollView) {
        
        if fmod(scroll.contentOffset.x, scroll.frame.maxX) == 0 {
            
            dots.currentPage = Int(scroll.contentOffset.x / scroll.frame.maxX)
            
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
