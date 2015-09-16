//
//  ViewController.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Cocoa

let MaxThreadNum:Int = 256

class ViewController: NSViewController {
    var queue : dispatch_queue_t = dispatch_queue_create("gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    var pauseFlag = 0
    var fuckingCount:Int64 = 0
    var threadCount = 0
    var threadCountLock = NSLock.init()
    
    @IBOutlet var fuckingCountLabel : NSTextField?
    @IBOutlet var startButton:NSButton?
    @IBOutlet var pauseButton:NSButton?
    
    
    override func viewDidLoad() {
        if #available(OSX 10.10, *) {
            super.viewDidLoad()
        } else {
            // Fallback on earlier versions
        }
        
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
        
        self.performSelectorInBackground(Selector("start"), withObject: nil)
    }
    
    @IBAction func pauseButtonClicked(x:NSButton){
        pauseButton!.enabled = false
        startButton!.enabled = true
        self.stop()
    }
    
    
    func start(){
        pauseFlag = 0
        
        while (self.pauseFlag == 0) {
            NSThread.sleepForTimeInterval(0.001)
            if (threadCount < MaxThreadNum){

                    dispatch_async(queue, { () -> Void in
                        autoreleasepool {

                        self.threadCountLock.lock()
                        self.threadCount += 1
                        self.threadCountLock.unlock()
                        
                        self.initFuckingDataAndPost()
                        }
                    })

                
            }
        }
    }
    
    func stop(){
        pauseFlag = 1
        
    }
    
    
    func initFuckingDataAndPost(){
        let fuckingData = FuckingRule.init()
        NetworkManager.shareInstance().sendFuckingData(fuckingData) { (succeed) -> Void in
            if (succeed){
                self.fuckingCount += 1
            }
            self.threadCountLock.lock()
            self.threadCount -= 1
            self.threadCountLock.unlock()
        }
        
    }
    
    func updateCounting(){
        fuckingCountLabel?.stringValue = "\(fuckingCount)"
    }
    
}

