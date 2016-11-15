//
//  GameEngine.swift
//  MyQuiz
//
//  Created by Training on 11/14/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
protocol GameEngine{
//    var quizar2:[Quiz]{get set}
    var score:Int{get set}
    var no:Int{get set}
    
    func loadQuiz()
    func calScore(rs:Bool)
    
}
