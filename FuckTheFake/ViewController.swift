//
//  ViewController.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Cocoa

let ThreadNum:Int = 32

class ViewController: NSViewController {
    var queue : dispatch_queue_t = dispatch_queue_create("gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    var group : dispatch_group_t = dispatch_group_create();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        start()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func start(){
        
        for _ in 0...ThreadNum {
            dispatch_group_async(group, queue) { () -> Void in
                while true {
                    self.initFuckingDataAndPost()
                }
            }
        }

        
    }
    
    
    func initFuckingDataAndPost(){        
        NetworkManager.shareInstance().sendFuckingData(FuckingRule.init())
    }

}

