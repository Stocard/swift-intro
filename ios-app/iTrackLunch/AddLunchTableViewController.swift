//
//  AddLunchTableViewController.swift
//  iTrackLunch
//
//  Created by Mark Himmelsbach on 11.04.16.
//  Copyright © 2016 de.stocard.iTrackLunch. All rights reserved.
//
import UIKit

class AddLunchTableViewController : UITableViewController {
    
    var model : Model?
    var doneButtonClickCallback : (() -> ())?
    var cancelButtonClickCallback : (() -> ())?
    
    @IBOutlet weak var lunchNameTextField: UITextField!
    @IBOutlet weak var lunchLocationTextField: UITextField!
    
    @IBAction func cancelClicked(sender: AnyObject) {
        cancelButtonClickCallback?()
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        let createdLunch = Lunch(title: lunchNameTextField.text, rating: 0.0, locationName: lunchLocationTextField.text, lunchDate: NSDate(), image: nil)
        model?.addLunch(createdLunch)
        doneButtonClickCallback?()
    }
    
}