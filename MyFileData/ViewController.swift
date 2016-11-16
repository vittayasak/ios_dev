//
//  ViewController.swift
//  MyFileData
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://pokedex-67742.firebaseio.com/pokedex.json"
        let pokemons = JSONUtil.getDataFromURL(urlStr: url, rootObj:"pokemon")

        for idx in 0...pokemons.count-1 {
            let pk = pokemons[idx] as [String:AnyObject]
            let name = pk["name"] as! String
            let num = pk["num"] as! String
            print("\(name) - \(num)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

