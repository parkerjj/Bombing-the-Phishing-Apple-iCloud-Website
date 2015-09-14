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
    var pauseFlag = 0
    var fuckingCount:Int64 = 0
    @IBOutlet var fuckingCountLabel : NSTextField?
    @IBOutlet var startButton:NSButton?
    @IBOutlet var pauseButton:NSButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer:NSTimer = NSTimer.scheduledTimerWithTimeInterval( 0.1, target: self, selector: Selector("updateCounting"), userInfo: nil, repeats: true)
        timer.fire()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func startButtonClicked(x:NSButton) {
        startButton!.enabled = false
        pauseButton!.enabled = true
        self.start()

    }
    
    @IBAction func pauseButtonClicked(x:NSButton){
        pauseButton!.enabled = false
        startButton!.enabled = true
        self.stop()
    }
    
    
    func start(){
        pauseFlag = 0
        for _ in 0...ThreadNum {
            dispatch_group_async(group, queue) { () -> Void in
                dispatch_group_enter(self.group);
                
                while self.pauseFlag == 0 {
                    self.initFuckingDataAndPost()
                    self.fuckingCount += 1
                    
                }
                
                dispatch_group_notify(self.group, self.queue, { () -> Void in
                    NSLog("Thread Stopping...")
                    dispatch_group_leave(self.group);
                })
            }
        }
    }
    
    func stop(){
        pauseFlag = 1

    }
    
    
    func initFuckingDataAndPost(){
        let fuckingData = FuckingRule.init()
        NetworkManager.shareInstance().sendFuckingData(fuckingData)
    }
    
    func updateCounting(){
        fuckingCountLabel?.stringValue = "\(fuckingCount)"
    }

}

