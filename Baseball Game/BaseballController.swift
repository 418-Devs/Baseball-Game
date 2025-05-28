//
//  BaseballController.swift
//  Baseball Game
//
//  Created by 이태윤 on 5/28/25.
//

import Foundation

class BaseballController {
    var model = BaseballModel()
    
    func computerNumber() {
        var set = Set<Int>()
        while set.count < 3 {
            set.insert(Int.random(in: 0...9))
        }
        model.computerNumber = Array(set)
    }
    
    func showComNumber() {
        print("컴퓨터의 숫자는 \(model.computerNumber)입니다.")
    }
    
    func userInput(){
        print("0~9 사이의 숫자 3개를 입력하세요.")
        guard let input = readLine() else { return }
        if inputCheck(inputcheck: input){
            let numbers = input.map{Int(String($0))!}
            model.userNumber = Array(numbers)
        }
        else{
            userInput()
        }
    }
    
    func showUesrNumber(){
        print("유저의 숫자는 \(model.userNumber)입니다.")
    }
    
    func inputCheck(inputcheck: String) -> Bool {
        let chars = Array(inputcheck)
        for i in 0..<chars.count {
            if Int(String(chars[i])) == nil || Int(String(chars[0])) == 0 {
                print("올바르지 않은 입력값 입니다.")
                return false
            }
        }
        
        let unique = Set(chars)
        if  unique.count != 3{
            print("올바르지 않은 입력값 입니다.")
            return false
        }
        else {
            return true
        }
    }
    
    func game() {
        var strike:Int = 0
        var ball:Int = 0
        for i in 0...2{
            if model.computerNumber[i] == model.userNumber[i] {
                strike += 1
            }
        }
        let comNum = Set(model.computerNumber)
        let userNum = Set(model.userNumber)
        let matchingNum = comNum.intersection(userNum)
        ball = matchingNum.count - strike
        
        if strike == 3 {
            print("3 strikes! 게임 승리!")
            model.result = true
        }
        else if strike == 0 && ball == 0 {
            print("Nothing")
        }
        else{
            print("strike : \(strike)  ball : \(ball)")
        }
        
    }
    
}
