//
//  JSONUtil.swift
//  Pokedex
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
class JSONUtil{
    /*---- Using ----
     let url = "https://pokedex-67742.firebaseio.com/pokedex.json"
     let pokemons = JSONUtil.getDataFromURL(urlStr: url, rootObj:"pokemon")
     
     for idx in 0...pokemons.count-1 {
     let pk = pokemons[idx] as [String:AnyObject]
     let name = pk["name"] as! String
     let num = pk["num"] as! String
     let imgUrl = pk["img"] as! String
     print("\(name) - \(num)")
     
     */
    
    static func getDataFromURL(urlStr:String, rootObj:String) -> [[String:AnyObject]]{
        let url=URL(string:urlStr)
        var json : [[String:AnyObject]] = [[String:AnyObject]]()
        do {
            let allJSONData = try Data(contentsOf: url!)
            let allJSONs = try JSONSerialization.jsonObject(with: allJSONData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            json = allJSONs[rootObj] as! [[String : AnyObject]]
        }
        catch let err as Error{
            print(err.localizedDescription)
        }
        return json
    }
}
