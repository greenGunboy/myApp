//
//  listViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit
import iAd

class listViewController: UIViewController {
    
    @IBOutlet weak var listTimeLabel: UILabel!
    @IBOutlet weak var listOneLabel: UILabel!
    @IBOutlet weak var listTwoLabel: UILabel!
    @IBOutlet weak var listThreeLabel: UILabel!
    @IBOutlet weak var listMemoText: UITextView!
    @IBOutlet weak var myAdBanner: ADBannerView!
    
    var scSeletedIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        self.myAdBanner.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var ud = NSUserDefaults.standardUserDefaults()
        var udResult:NSArray = ud.objectForKey("ideaList") as! NSArray
        self.listTimeLabel.text = udResult[scSeletedIndex]["time"] as! String
        self.listOneLabel.text = udResult[scSeletedIndex]["one"] as! String
        self.listTwoLabel.text = udResult[scSeletedIndex]["two"] as! String
        self.listThreeLabel.text = udResult[scSeletedIndex]["three"] as! String
        listMemoText.text = "\(udResult[scSeletedIndex]["memo"] as! String)"
        listMemoText.editable = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!){
        self.myAdBanner.hidden = false
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave:Bool) ->Bool{
        return willLeave
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!){
        self.myAdBanner.hidden = true
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
