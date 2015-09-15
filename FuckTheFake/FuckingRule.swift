//
//  FuckingRule.swift
//  FuckTheFake
//
//  Created by Parker on 9/11/15.
//  Copyright © 2015 Parker. All rights reserved.
//

import Foundation
import Darwin

let usernameNameArray:Array = ["username","u","sjname","proname"]
let usernameArray:Array = ["your@email.address"]
let passwordNameArray:Array = ["password","p","sjpass","username"]
let passwordArray:Array = ["别他妈给我发这垃圾短信了！！","你发我一条！我炸你一万条！"]
let urlArray:Array = ["http://www.clond.com.cn/ICloud13/save.asp","http://www.app-id-icloud.cc/360test/save.asp","http://ruvpn.gq/Save.asp","http://www.id-chicloud.com/bdorder.asp","http://www.id-appicloud.com/bdorder.asp","http://icloud.store-china.top/save.asp","http://www.apple-icloudmyiphone.com/cn/Save3.asp","http://www.houtai123.in/new/mbsave1.php","http://www.myapple-id.cc//itunes/ht/icloud.asp"]



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
        
        let data = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        return data!
    }
    
    
    override init() {
        super.init()
        
        let usernameR = random() % usernameArray.count
        let usernameS:String! = usernameArray[usernameR]
        
        let passwordR = random() % passwordArray.count
        let passwordS:String! = passwordArray[passwordR]
        
        
        let urlR = random() % urlArray.count
        var urlS:String = urlArray[urlR]
        urlS += "?"
        for str:String in usernameNameArray{
            urlS += "\(str)=\(usernameS)&"
        }
        
        for str:String in passwordNameArray{
            urlS += "\(str)=\(passwordS)&"
        }
        
        
        urlS = urlS.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        self.url = NSURL(string: urlS)
        self.username = usernameS
        self.password = passwordS
        
        

        
    }
}

