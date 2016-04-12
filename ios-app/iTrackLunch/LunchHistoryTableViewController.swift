//
//  LunchHistoryTableViewController.swift
//  iTrackLunch
//
//  Created by Mark Himmelsbach on 11.04.16.
//  Copyright © 2016 de.stocard.iTrackLunch. All rights reserved.
//

import UIKit

class LunchTableViewController : UITableViewController {

    var model : Model?
    @IBOutlet weak var lunchAddBarButton: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationNavCon = segue.destinationViewController as? UINavigationController
        let addLunchTableViewController = destinationNavCon?.viewControllers.first as? AddLunchTableViewController
        addLunchTableViewController?.model = self.model
        addLunchTableViewController?.cancelButtonClickCallback = {
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
            self.tableView.reloadData()
        }
        addLunchTableViewController?.doneButtonClickCallback = addLunchTableViewController?.cancelButtonClickCallback
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let lunches = model?.getLunches() {
            return lunches.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let lunches = model!.getLunches()
        let lunchCellData = lunches[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Lunch") as? LunchCell
        cell?.lunchTitleLabel.text = lunchCellData.title
        cell?.lunchLocation.text = lunchCellData.locationName
        return cell!
    }
}