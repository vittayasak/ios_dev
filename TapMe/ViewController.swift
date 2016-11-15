//
//  ViewController.swift
//  TapMe
//
//  Created by Training on 11/15/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var count=30
    var timmer:Timer!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func subtractTime(){
        count -= 1
        timerLabel.text = "Time: \(count)"
        if(count <= 0){
            timmer.invalidate()
            
            
            let alert = UIAlertController(title: "Time is up!",
                                          message: "You scored \(score) points",
                preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: {
                action in self.setupGame()
            }))
            
            self.present(alert, animated: true, completion:nil)
//            self.presentViewController(alert, animated: true, completion:nil)
        }
    }
    func setupGame(){
        count = 30
        score = 0
        timmer = Timer.scheduledTimer(timeInterval: 1,
                              target: self,
                              selector: #selector(self.subtractTime),
                              userInfo: nil,
                              repeats: true)
    }
    
    
    @IBAction func btnTapMe(_ sender: Any) {
        score += 1
        scoreLabel.text = "Score\n\(score)"
        if score == 1{
            setupGame()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---viewDidLoad---")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("---didReceiveMemoryWarning---")
        // Dispose of any resources that can be recreated.
    }


}

