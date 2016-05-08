//
//  tableViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit
import iAd
import GoogleMobileAds

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GADBannerViewDelegate {
    
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    var selectedIndex:Int = 0
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myAdBanner: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var admobView: GADBannerView = GADBannerView()
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPointMake(0, self.view.frame.size.height - admobView.frame.height)
        
        admobView.frame.size = CGSizeMake(self.view.frame.width, admobView.frame.height)
        admobView.adUnitID = AdMobID
        admobView.delegate = self
        admobView.rootViewController = self
        
        let admobRequest:GADRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                admobRequest.testDevices = [kGADSimulatorID]
            }
            else {
                admobRequest.testDevices = [TEST_DEVICE_ID]
            }
            
        }
        
        admobView.loadRequest(admobRequest)
        self.view.addSubview(admobView)
        
        self.canDisplayBannerAds = true
        self.myAdBanner.hidden = true
        myTableView.delegate = self
        
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
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var ud = NSUserDefaults.standardUserDefaults()
        var ideaList = ud.arrayForKey("ideaList")!
        
        ideaList.removeAtIndex(indexPath.row)
        
        ud.setObject(ideaList, forKey: "ideaList")
        
        tableView.reloadData()
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var ud = NSUserDefaults.standardUserDefaults()
        var udideaList: NSArray? = ud.objectForKey("ideaList") as? NSArray
        if udideaList == nil{
            udideaList = []
        }
        return udideaList!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var ud = NSUserDefaults.standardUserDefaults()
        var udideaList: NSArray! = ud.objectForKey("ideaList") as! NSArray
        
        var cell = UITableViewCell(style: .Default,reuseIdentifier: "myCell")
        
        cell.textLabel?.text = "\(udideaList[indexPath.row]["time"] as! String)"
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndex = indexPath.row
        performSegueWithIdentifier("listViewSegue", sender: nil)
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

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "listViewSegue" {
        var listVC = segue.destinationViewController as! listViewController
        listVC.scSeletedIndex = selectedIndex
        }
        
    }
    
    @IBAction func backSwipe(sender: UISwipeGestureRecognizer) {
        
        var targetView: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("viewController")
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
