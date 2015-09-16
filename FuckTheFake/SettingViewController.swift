//
//  SettingViewController.swift
//  FuckTheFake
//
//  Created by Parker on 15/9/15.
//  Copyright © 2015年 Parker. All rights reserved.
//

import Foundation
import Cocoa


class SettingViewController: NSViewController , NSTableViewDelegate , NSTableViewDataSource {
    
    var urlList = FuckingRule.getURLList()!
    @IBOutlet var tableView : NSTableView?
    
    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        } else {
            // Fallback on earlier versions
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    override func viewWillDisappear() {
        FuckingRule.saveURLList(nonull: urlList)
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return urlList.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        
        return urlList[row];
        
    }
    
    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 20
    }
    
    override func controlTextDidEndEditing(obj: NSNotification) {        
        let _tableView = obj.object
        if _tableView is NSTableView {
            let selectedIndex = _tableView?.selectedRow
            let newUrl = _tableView?.selectedCell()?.title
            urlList[selectedIndex!] = newUrl!
            
        }
    }
    
    @IBAction func addNewRow(button : NSButton){
        tableView?.beginUpdates()
        urlList.append("http://www.example.com/example.asp")
        tableView?.insertRowsAtIndexes(NSIndexSet.init(index: urlArray.count), withAnimation: NSTableViewAnimationOptions.SlideLeft)
        tableView?.endUpdates()
    }
    
    
    @IBAction func deleteRow(button : NSButton){
        let selectedIndex = tableView?.selectedRow
        
        if selectedIndex > 0 {
            tableView?.beginUpdates()
            
            urlList.removeAtIndex((tableView?.selectedRow)!)
            
            tableView?.removeRowsAtIndexes(NSIndexSet.init(index: (tableView?.selectedRow)!), withAnimation: NSTableViewAnimationOptions.SlideRight)
            tableView?.endUpdates()
            
            
        }
    }
    
    
}