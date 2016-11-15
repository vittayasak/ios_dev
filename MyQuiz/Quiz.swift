//
//  Quiz.swift
//  MyQuiz
//
//  Created by Training on 11/14/16.
//  Copyright © 2016 Training. All rights reserved.
//

import Foundation
class Quiz{
    var q1:String
    var a1:String
    var a2:String
    var a3:String
    var a4:String
    var sol:String
    
    init(_ q1:String,_ a1:String,_ a2:String,_ a3:String,_ a4:String,_ sol:String){
        self.q1=q1
        self.a1=a1
        self.a2=a2
        self.a3=a3
        self.a4=a4
        self.sol=sol
    }
    
    func checkAns(ans:String) ->Bool{
        return ans == self.sol
    }
    
}
