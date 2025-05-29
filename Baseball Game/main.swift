import Foundation


class BasebollGame {
    
    // MARK: - 전체 흐름 시작
    func start() {
        let answer = makeAnswer() // 정답 값

        while true {
            let input = getInput() // 내가 입력한 값
            let result = check(answer, input)

            showResult(strike: result.strike, ball: result.ball)
            if result.strike == 3 {
                break
            }
        }
    }
    
    // MARK: - 랜덤 값 생성
    func makeAnswer() -> [Int] {
        let first = (1...9).shuffled().first!
        let rest = Array((0...9).filter { $0 != first }.shuffled())
        return [first] + rest.prefix(2)
    }
    
    // MARK: - 정답 입력
    func getInput() -> [Int] {
        while true {
            let input = readLine() ?? ""
            let inputNumbers = input.compactMap { Int(String($0)) }
            
            // 예외
            guard inputNumbers.count == 3 else { // 세 자리 숫자가 아닐 경우
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            guard Set(inputNumbers).count == 3 else { // 중복된 값이 있을 경우
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            return inputNumbers
        }
    }
    
    // MARK: - 결과 판정
    func check(_ answer: [Int], _ input: [Int]) -> (strike: Int, ball: Int) {
        var ball = 0
        var strike = 0
        
        for i in 0..<answer.count {
            if answer[i] == input[i] {
                strike += 1
            } else if answer.contains(input[i]) {
                ball += 1
            }
        }
        return (strike, ball)
    }
    
    // MARK: - 결과값 확인
    func showResult(strike: Int, ball: Int) {
        if strike == 3 {
            print("\(strike)스트라이크")
        } else if ball == 3 {
            print("\(ball)볼")
        } else if strike == 0 && ball == 0 {
            print("Nothing")
        } else {
            print("\(strike)스트라이크 \(ball)볼")
        }
    }
}

let game = BasebollGame()
game.start()



