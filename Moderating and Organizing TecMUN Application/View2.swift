//
//  View2.swift
//  Moderating and Organizing TecMUN Application
//
//  Created by Javier Rodriguez on 2/9/16.
//  Copyright © 2016 TecMUN. All rights reserved.
//

import Cocoa

class View2: NSViewController, NSTableViewDelegate, NSTableViewDataSource{

    @IBOutlet var Committee: NSTextField!
    @IBOutlet var TopicA: NSTextField!
    @IBOutlet var TopicB: NSTextField!
    @IBOutlet var President: NSTextField!
    @IBOutlet var Countries: NSComboBox!
    @IBOutlet var Lista2: NSTableView!

 
    
    
    var listapa2: NSMutableArray! = NSMutableArray()
    @IBAction func addcount(sender: AnyObject) {
        if (Countries.stringValue == ""){
        }
        else {
            self.listapa2.addObject(Countries.stringValue)
            self.Lista2.reloadData()
            SharingManager.sharedInstance.data.addObject(Countries.stringValue)
            
        }
    }
    @IBAction func Remcount(sender: AnyObject) {
        listapa2.removeObjectAtIndex(Lista2.selectedRow)
        Lista2.reloadData()
        
    }
    @IBAction func Ready(sender: AnyObject) {
        SharingManager.sharedInstance.Committee = self.Committee.stringValue
        SharingManager.sharedInstance.President = "President: "+self.President.stringValue
        SharingManager.sharedInstance.TopicA = "Topic: "+self.TopicA.stringValue
        SharingManager.sharedInstance.TopicB = "Topic: "+self.TopicB.stringValue
        
        
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.listapa2.count
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cellView = Lista2.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView
        cellView.textField?.stringValue = self.listapa2.objectAtIndex(row) as! String
        return cellView
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        
    }
    
    
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let image = NSImage(named:"background.png")
            //let color : CGColorRef = CGColorCreateGenericRGB(0.2, 0.2, 0.2, 0.5)
            //self.view.layer?.backgroundColor = color
            self.view.layer?.contents = image
        }
        
    }

    
}
