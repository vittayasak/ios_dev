//
//  MockGameEngine.swift
//  MyQuiz
//
//  Created by Training on 11/14/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
class MockGameEngine : GameEngine{
    var quizar=[Quiz?](repeating: nil, count:10)
    var score:Int=0
    var no:Int = 1
    var idx:Int=0
    
    init(){
        
    }
    func loadQuiz(){
        for i in 0...9{
            var quiz = Quiz("q\(i)",
                "aa\(i)",
                "bb\(i)",
                "cc\(i)",
                "dd\(i)",
                "cc\(i)"
            )
            quizar[i] = quiz
        }
    }
    func calScore(rs:Bool){
        if rs {
            self.score += 1
        }else{
            self.score -= 1
        }
    }
}
