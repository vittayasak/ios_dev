//
//  ViewController.swift
//  MyQuiz
//
//  Created by Training on 11/14/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNo: UILabel!
    
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btnAns1Caption: UIButton!
    
    @IBOutlet weak var btnAns2Caption: UIButton!
    
    @IBOutlet weak var btnAns3Caption: UIButton!
    
    @IBOutlet weak var btnAns4Caption: UIButton!
    
    @IBAction func btnAns(_ sender: UIButton) {
        var q = game.quizar[game.idx]!
        let ans = sender.titleLabel?.text!
        print("Your ans: \(ans!)")
        if q.sol == ans{
            game.idx = (game.idx+1) % game.quizar.count
            
            updateUI()
//            self.view.makeToast("Correct!!", duration: 3.0, position: .Top)
        }
    }
    
    var game = MockGameEngine()
    
    
    func updateUI(){
        var q = game.quizar[game.idx]!
        lblQuestion.text = q.q1
       
        btnAns1Caption.setTitle(q.a1, for:UIControlState.normal)
        btnAns2Caption.setTitle(q.a2, for:UIControlState.normal)
        btnAns3Caption.setTitle(q.a3, for:UIControlState.normal)
        btnAns4Caption.setTitle(q.a4, for:UIControlState.normal)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.loadQuiz()
        updateUI()
        //var quiz1 = Quiz("qq","aa1","bb2","cc3","dd4","bb2")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

