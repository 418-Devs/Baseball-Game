//
//  main.swift
//  precamp_ios_study_06
//
//  Created by 이태윤 on 5/26/25.
//  야구게임

import Foundation

var count: [Int: Int] = [:]
var mcount: Int = 0

while true {
    print("1 : 게임시작  2 : 게임기록  3 : 게임 종료")
    let input = readLine() ?? ""
    if input == "1" {
        mcount += 1
        count[mcount] = gameStart()
    }
    else if input == "2" {
        gameRecord(record:count)
    }
    else if input == "3" {
        print("게임을 종료합니다.")
        break
    }
    else {
        print("올바른 숫자를 입력해 주세요.")
    }
}


func gameStart() -> Int{
    var count: Int = 0
    let comArray: [Int] = getComnumbers()
    print(comArray)
    while true{
        print("0~9 사이의 숫자 3개를 입력하세요.")
        var strike: Int = 0
        var ball: Int = 0
        count += 1
        let input: String = readLine() ?? " "
        if !inputCheck(check: input) {
            print("올바르지 않은 입력값 입니다.")
            continue
        }
        let inputArray: [String] = input.split(separator: "").map(String.init)

        for i in 0...2{
            for j in 0...2{
                if(i==j){
                    if comArray[i] == Int(inputArray[j]) {
                        strike += 1
                    }
                }
                else{
                    if comArray[i] == Int(inputArray[j]) {
                        ball += 1
                    }
                }
            }
        }
        
        if strike == 3 {
            print("3 strikes! 게임 승리!")
            return count
        }
        else if strike == 0 && ball == 0 {
            print("Nothing")
        }
        else{
            print("strike : \(strike)  ball : \(ball)")
        }
    }
}

func getComnumbers() -> [Int] {
    var comArray: [Int] = []

    while comArray.count < 3 {
        let num = Int.random(in: 0...9)

        if comArray.isEmpty && num == 0 {
            continue // 첫 자리는 0이면 건너뛴다
        }

        if !myContains(array: comArray, number: num) {
            comArray.append(num)
        }
    }

    return comArray
}

func gameRecord(record: [Int:Int]) {
    for key in record.keys.sorted() {
        if let count = record[key] {
            print("\(key)회차 시도 횟수 : \(count)")
        }
    }
}

func myContains(array: [Int], number: Int) -> Bool {
    for element in array {
        if element == number {
            return true
        }
    }
    return false
}

func inputCheck(check: String) -> Bool{
    // 길이 체크
    if check.count != 3 {
        return false
    }
    
    // 숫자인지 체크
    let checking = Array(check)
    var check: [Int] = []
    for int in checking{
        if let num = Int(String(int)){
            check.append(num)
        } else {
            return false
        }
    }
    
    // 중복체크
    for i in 0..<checking.count {
        for j in i+1..<checking.count {
            if check[i] == check[j] {
                return false
            }
        }
    }
    
    return true
}
