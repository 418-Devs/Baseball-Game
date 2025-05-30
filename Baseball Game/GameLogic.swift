//
//  GameLogic.swift
//  Baseball Game
//
//  Created by 서광용 on 5/29/25.
//

final class GameLogic {

    // MARK: - 랜덤 값 생성
    static func makeAnswer() -> [Int] {
        // first는 1~9중 하나, rest는 0~9중 두개. first + rest 합쳐서 처음에 0이 오지 않고 중복되지 않는 랜덤 값 3개 생성
        let first = (1...9).shuffled().first!
        let rest = Array((0...9).filter { $0 != first }.shuffled())
        return [first] + rest.prefix(2)
    }
    
    
    // MARK: - 결과 판정
    static func compareAnswer(_ answer: [Int], _ userInput: [Int]) -> (strike: Int, ball: Int) {
        var ball = 0
        var strike = 0
        
        for i in 0..<answer.count {
            if answer[i] == userInput[i] {
                strike += 1
            } else if answer.contains(userInput[i]) {
                ball += 1
            }
        }
        return (strike, ball)
    }
    
    // MARK: - 결과값 출력
    static func printResult(strike: Int, ball: Int) {
        if strike == 3 {
            print("\(strike)스트라이크!")
        }
        
        else if ball == 3 {
            print("\(ball)볼")
        }
        
        else if strike == 0 && ball == 0 {
            print("맞은 숫자가 없습니다.")
        }
        
        else {
            print("\(strike)스트라이크 \(ball)볼")
        }
    }
}

