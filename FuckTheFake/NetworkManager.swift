//
//  NetworkManager.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Foundation


class NetworkManager: NSObject {
//    var sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration();
//    var sessionDic : NSMutableDictionary!
//    var sessionDicLock = NSLock()
    
    class func shareInstance()->NetworkManager{
        struct YRSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:NetworkManager? = nil
        }
        dispatch_once(&YRSingleton.predicate,{
            YRSingleton.instance=NetworkManager()
            
//            YRSingleton.instance!.sessionConfig.timeoutIntervalForRequest = 3;
//            YRSingleton.instance!.sessionConfig.timeoutIntervalForResource = 2;
//            YRSingleton.instance!.sessionConfig.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
//            
//            YRSingleton.instance!.sessionDic = NSMutableDictionary()
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
            request.timeoutInterval = 2.0
            
            
            // 用NSURLConnection内存泄露就很少
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                responseBlock(succeed: error==nil)

            })
            
            
            // 用URLSession内存泄露很严重
//            var session : NSURLSession? = sessionDic.objectForKey(fuckingData.url.host!) as? NSURLSession
//            if session == nil {
//                session = NSURLSession.init(configuration: sessionConfig)
//                sessionDicLock.lock()
//                sessionDic.setObject(session!, forKey: fuckingData.url.host!)
//                sessionDicLock.unlock()
//            }
//            
//            session!.dataTaskWithRequest(request) { (data, response, error) -> Void in
//                if error != nil {
//                    //                    print(error)
//                }
//                responseBlock(succeed: error==nil)
//                
//                //            session!.finishTasksAndInvalidate()
//                }.resume()

        }
        
    }
    
}