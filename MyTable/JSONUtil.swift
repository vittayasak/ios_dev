//
//  JSONUtil.swift
//  MyTable
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
class JSONUtil{
    static func getDataFromURL(urlStr:String){
        let url=URL(string:urlStr)
        do {
                       let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["pokemon"] {
                for index in 0...arrJSON.count-1 {
                    
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    
                    let name = aObject["name"] as! String
                    let num = aObject["num"] as! String
                    print("\(num) - \(name)")
                }
            }
         
        }
        catch let err as Error{
            print(err.localizedDescription)
        }
        
    }
}
