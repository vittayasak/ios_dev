//
//  PokeDetailViewController.swift
//  Pokedex
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class PokeDetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailName: UILabel!
    
    var pk:[String:AnyObject]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = pk["name"] as! String
        let imgURL = pk["img"] as! String
        detailName.text = name
        ImageUtil.loadImageByURL(imgView: detailImage, urlStr: imgURL)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
