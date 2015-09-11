//
//  FuckingRule.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Foundation

let usernameNameArray:Array = ["username","u"]
let usernameArray:Array = ["parkerlpg@me.com"]
let passwordNameArray:Array = ["password","p"]
let passwordArray:Array = ["别他妈给我发这垃圾短信了！！","你发我一条！我炸你一万条！"]
let urlArray:Array = ["http://www.clond.com.cn/ICloud13/save.asp"]



class FuckingRule : NSObject {
    var url:NSURL!
    var usernameName:String! = ""
    var username:String! = ""
    var passwordName:String! = ""
    var password:String! = ""
    
    func toPostData()->NSData{
        let str = "\(usernameName)=\(username)&\(passwordName)=\(password)"
        let data:NSData = (str as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
        return data;
    }
    
    func init() {
        let usernameNameR = Int(arc4random_uniform(usernameNameArray.count))

        
    }
}

