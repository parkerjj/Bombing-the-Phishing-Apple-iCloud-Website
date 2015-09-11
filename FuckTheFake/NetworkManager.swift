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
    
    
    func sendFuckingData(fuckingData : FuckingRule){
        
        let _request = NSMutableURLRequest(URL: fuckingData.url)
        _request.setValue("FUCKING AGENT", forHTTPHeaderField: "User-Agent")
        _request.HTTPMethod = "POST"
        _request.HTTPBody = fuckingData.toPostData()
        
        
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse? >= nil
        
        do {
            try NSURLConnection.sendSynchronousRequest(_request, returningResponse: response)

        }catch {
            print(error)
        }
        
        
        NSLog("Sending");
    }
    
}