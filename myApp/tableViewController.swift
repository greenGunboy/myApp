//
//  tableViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedIndex:Int = 0
    
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
        var udideaList: NSArray! = ud.objectForKey("ideaList") as! NSArray
        
        return udideaList.count
        
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
        
        performSegueWithIdentifier("listViewController", sender: nil)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "listViewController" {
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
