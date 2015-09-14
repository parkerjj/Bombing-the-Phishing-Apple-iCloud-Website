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
            NSThread.sleepForTimeInterval(0.01)
            if (threadCount < MaxThreadNum){
                autoreleasepool {
                    self.threadCount++
                    dispatch_async(queue, { () -> Void in
                        self.initFuckingDataAndPost()
                    })
                }
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
                self.threadCount--
            }
        

    }
    
    func updateCounting(){
        fuckingCountLabel?.stringValue = "\(fuckingCount)"
    }

}

