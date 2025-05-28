//
//  BaseBallController.swift
//  Baseball Game
//
//  Created by 이태윤 on 5/28/25.
//
import Foundation

class BaseballController {
    var model = BaseballModel()
    
    func ComputerNumber() {
        var set = Set<Int>()
        while set.count < 3 {
            set.insert(Int.random(in: 1...9))
        }
        model.computerNumber = Array(set)
    }
    
    func showComNumber() {
        print("컴퓨터의 숫자는 \(model.computerNumber)입니다.")
    }
}
