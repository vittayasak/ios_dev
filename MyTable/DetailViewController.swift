//
//  DetailViewController.swift
//  MyTable
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    
    var name:String!
    var imgView: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = name
        detailImage.image = imgView
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
