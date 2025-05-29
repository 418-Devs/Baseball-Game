//
//  BaseballController.swift
//  Baseball Game
//
//  Created by 이태윤 on 5/28/25.
//

import Foundation

class BaseballController {
    var model = BaseballModel()
    var tryCount = 0
    var roundCount = 0

    
    // 게임 상태 사용자 입력
    func inputStatus() {
        let input = readLine() ?? " "
        model.stateSelect = Int(input) ?? 0
        model.result = false
    }
    
    // 컴퓨터 난수 생성
    func computerNumber() {
        var set = Set<Int>()
        while set.count < 3 {
            set.insert(Int.random(in: 0...9))
        }
        var comArray = Array(set)
        
        if comArray[0] == 0{
            if let idx = comArray.firstIndex(where: { $0 != 0 }) {
                comArray.swapAt(0, idx)
            }
        }
        model.computerNumber = comArray
    }
    
    // 컴퓨터 난수 show
    func showComNumber() {
        print("컴퓨터의 숫자는 \(model.computerNumber)입니다.")
    }
    
    // 유저 숫자 입력
    func userInput(){
        print("0~9 사이의 숫자 3개를 입력하세요.")
        guard let input = readLine() else { return }
        if inputCheck(inputcheck: input){
            let numbers = input.map{Int(String($0))!}
            model.userNumber = Array(numbers)
            tryCount += 1
        }
        else{
            userInput()
        }
    }
    
    // 유저 입력 숫자 show
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
    
    // 게임 시작
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
            roundCount += 1
            model.record.insert(tryCount, at: roundCount-1)
            tryCount = 0;
            
        }
        else if strike == 0 && ball == 0 {
            print("Nothing")
        }
        else{
            print("strike : \(strike)  ball : \(ball)")
        }
    }
    // 게임기록 보기
    func readRecord(){
        if model.record.isEmpty {
            print("아직 기록이 없습니다.")
        } else {
            for i in 0..<model.record.count{
                print("\(i+1)회차 시도 횟수 : \(model.record[i])")
            }
        }
    }
    
    // 게임종료
    func gameExit(){
        print("게임을 종료합니다.")
        exit(0)
    }
    
}
