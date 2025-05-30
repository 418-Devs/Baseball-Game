//
//  GameFlow.swift
//  Baseball Game
//
//  Created by 서광용 on 5/29/25.
//

final class GameFlow {
    
    // MARK: - 메뉴 목록부터 시작
    func start() {
        while true {
            print("""
            원하시는 번호를 입력해주세요.
            1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
            """)
            let menu = InputManager.getMenuSelection()
            
            switch menu {
            case 1:
                run()
            case 2:
                GameRecordManager.show()
            case 3:
                print("게임을 종료합니다.")
                return
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    // MARK: - 게임 실행
    func run() {
        var tryCount: Int = 0
        print("""
            
            < 게임 규칙 >
            1. 정답 숫자는 0~9 사이의 중복되지 않는 3자리 입니다.
            2. 첫 자리는 0이 올 수 없습니다.
            3. 스트라이크 3이면 정답! 이후 메뉴로 돌아가집니다.
            
            게임이 시작되었습니다. 3자리 숫자를 입력해주세요.
            
            """)
        let answer = GameLogic.makeAnswer() // 정답 값

        while true {
            let input = InputManager.getInput() // 유저 입력 값
            tryCount += 1
            let result = GameLogic.compareAnswer(answer, input) // 결과 판정
            GameLogic.printResult(strike: result.strike, ball: result.ball) // 결과값 출력
            
            if result.strike == 3 {
                print("축하합니다! 정답입니다. 이제 메뉴로 돌아갑니다.")
                let record = GameRecord(tryCount: tryCount)
                GameRecordManager.add(record) // 시도한 횟수 기록
                return
            }
        }
    }
}
