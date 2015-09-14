//
//  AppDelegate.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSURLCache.setSharedURLCache(NSURLCache.init(memoryCapacity: 0, diskCapacity: 0, diskPath: nil))
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

