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
    
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        
        
        return "123";
    
    }

    
}