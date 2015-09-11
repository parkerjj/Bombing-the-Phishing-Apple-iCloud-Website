//
//  FuckingRule.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Foundation
import Darwin

let usernameNameArray:Array = ["username","u"]

@error "请修改下面这行"
let usernameArray:Array = ["YourEmailAddress@icloud.com"]
let passwordNameArray:Array = ["password","p"]
let passwordArray:Array = ["别他妈给我发这垃圾短信了！！","你发我一条！我炸你一万条！"]
let urlArray:Array = ["http://www.clond.com.cn/ICloud13/save.asp","http://www.app-id-icloud.cc/360test/save.asp"]



class FuckingRule : NSObject {
    var url:NSURL!
    var username:String! = ""
    var password:String! = ""
    
    func toPostData()->NSData{
        
        var postString = ""
        for str:String in usernameNameArray{
            postString += "&\(str)=\(username)"
        }
        
        for str:String in passwordNameArray{
            postString += "&\(str)=\(password)"
        }
        
        
        let data:NSData = (postString as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
        return data;
    }
    
    
    override init() {
        super.init()
        
        let usernameR = random() % usernameArray.count
        let usernameS:String! = usernameArray[usernameR]
        
        let passwordR = random() % passwordArray.count
        let passwordS:String! = passwordArray[passwordR]
        
        
        let urlR = random() % urlArray.count
        let urlS:String! = urlArray[urlR]
        
        self.url = NSURL(string: urlS)
        self.username = usernameS
        self.password = passwordS
        
    }
}

