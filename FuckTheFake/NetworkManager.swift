//
//  NetworkManager.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Foundation


class NetworkManager: NSObject {
    class func shareInstance()->NetworkManager{
        struct YRSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:NetworkManager? = nil
        }
        dispatch_once(&YRSingleton.predicate,{
            YRSingleton.instance=NetworkManager()
            }
        )
        return YRSingleton.instance!
    }
    
    
    func sendFuckingData(fuckingData : FuckingRule, responseBlock: (succeed:Bool) -> Void){
        
        autoreleasepool { () -> () in
            let request = NSMutableURLRequest(URL: fuckingData.url)
            request.HTTPMethod = "POST"
            request.HTTPBody = fuckingData.toPostData()
            request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
            request.timeoutInterval = 3.0
//            let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
//            sessionConfig.timeoutIntervalForRequest = 3;
//            sessionConfig.timeoutIntervalForResource = 2;
//            sessionConfig.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
//            sessionConfig.URLCache = NSURLCache.init(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
//            
//            let session = NSURLSession.init(configuration: sessionConfig)
//            let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
//                if error != nil {
//                    //                    print(error)
//                }
//                responseBlock(succeed: error==nil)
//                
//                session.finishTasksAndInvalidate()
//                }.resume()
            //            responseBlock(succeed: true)
            
        
        
        
        
            do {
                try NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
                
                //            NSURLConnection.sendAsynchronousRequest(_request, queue: NSOperationQueue.mainQueue(), completionHandler: {response,data,error in
                //
                //                if error != nil {
                ////                    NSLog("Send Error : %@", error!)
                //                }else{
                ////                    NSLog("Sent Succeed!");
                //
                //                }
                //
                //                /* code goes here */
                //
                //            })
                
            }catch {
                responseBlock(succeed: false)
                return
            }
            responseBlock(succeed: true)
        }
    }
    
}