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
        
        let request = NSMutableURLRequest(URL: fuckingData.url)
        request.HTTPMethod = "POST"
        request.HTTPBody = fuckingData.toPostData()
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        request.timeoutInterval = 3.0
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.timeoutIntervalForRequest = 3;
        sessionConfig.timeoutIntervalForResource = 2;
        sessionConfig.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData
        
        let session = NSURLSession.init(configuration: sessionConfig)
        _ = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error != nil {
                //                    print(error)
            }
            responseBlock(succeed: error==nil)
            
            session.finishTasksAndInvalidate()
            }.resume()
    }
    
}