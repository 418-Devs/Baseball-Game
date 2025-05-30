//
//  InputManager.swift
//  Baseball Game
//
//  Created by 서광용 on 5/29/25.
//

final class InputManager {
    // MARK: - 사용자 입력 처리
    static func getInput() -> [Int] {
        while true {
            let input = readLine() ?? ""
            let validated = validateInput(input)
            
            if let numbers = validated {
                return numbers
            }
        }
    }
    
    // MARK: - 사용자 입력 검증
    static func validateInput(_ input: String) -> [Int]? {
        let inputNumbers = input.compactMap { Int(String($0)) }
        
        guard inputNumbers.count == 3 else { // 세 자리 숫자가 아닐 경우
            print("입력하신 숫자가 세 자리 숫자가 아닙니다. 세 자리 숫자를 입력해주세요.")
            return nil
        }
        
        guard Set(inputNumbers).count == 3 else { // 중복된 값이 있을 경우
            print("중복된 숫자가 있습니다. 중복되지 않은 숫자를 입력해주세요.")
            return nil
        }
        
        guard inputNumbers[0] != 0 else { // 첫 번째에 0이 오지 않음
            print("첫 번째 숫자는 0이 올 수 없습니다. 다시 입력해주세요.")
            return nil
        }
        
        return inputNumbers
    }
    
    // MARK: - 메뉴 값 입력
    static func getMenuSelection() -> Int {
        while true {
            let input = readLine() ?? ""
            if let menuNumber = validateMenuSelection(input) {
                return menuNumber
            }
        }
    }
    
    // MARK: - 메뉴 값 입력 검증
    static func validateMenuSelection(_ input: String) -> Int? {
        guard let number = Int(input), (1...3).contains(number) else { // 앞 조건 성공 -> 뒷 조건 평가
            print("올바르지 않은 선택입니다. 1번, 2번, 3번 중에서 하나를 입력해주세요.")
            return nil
        }
        return number
    }
}
