//
//  listViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit
import GoogleMobileAds

class listViewController: UIViewController, GADBannerViewDelegate {
    
    let YOUR_ID = "ca-app-pub-3612887199188449/3226502612"  // Enter Ad's ID here
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0" // Enter Test ID here
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    @IBOutlet weak var listTimeLabel: UILabel!
    @IBOutlet weak var listOneLabel: UILabel!
    @IBOutlet weak var listTwoLabel: UILabel!
    @IBOutlet weak var listThreeLabel: UILabel!
    @IBOutlet weak var listMemoText: UITextView!
    
    var scSeletedIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerView:GADBannerView = getAdBannerView()
        self.view.addSubview(bannerView)
        
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
        
    }
    
    private func getAdBannerView() -> GADBannerView {
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPointMake(0, self.view.frame.size.height - bannerView.frame.height)
        bannerView.frame.size = CGSizeMake(self.view.frame.width, bannerView.frame.height)
        bannerView.adUnitID = "\(YOUR_ID)"
        bannerView.delegate = self
        bannerView.rootViewController = self
        
        var request:GADRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                request.testDevices = [kGADSimulatorID]
            } else {
                request.testDevices = [TEST_DEVICE_ID]
            }
        }
        
        bannerView.loadRequest(request)
        
        return bannerView
    }
    
    override func viewWillAppear(animated: Bool) {
        
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
