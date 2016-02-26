//
//  tableViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/23.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedIndex = 0
    var listArray:[NSDictionary] = []
    
    
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
        
        cell.textLabel?.text = udideaList[indexPath.row]["time"] as! String
        
        return cell
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("listViewController", sender: nil)
        selectedIndex = indexPath.row
        
    }
    
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            var ud = NSUserDefaults.standardUserDefaults()
            listArray = ud.objectForKey("ideaList")! as! [NSDictionary]
            if editingStyle == .Delete {
                listArray.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else if editingStyle == .Insert {
                
            }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var listVC = segue.destinationViewController as! listViewController
        listVC.scSeletedIndex = selectedIndex
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
