//
//  record.swift
//  Baseball Game
//
//  Created by 서광용 on 5/29/25.
//

// MARK: - 게임 기록 보관
struct GameRecord {
    let tryCount: Int
    // 추후에 정답값 등 다른 정보도 추가할 수 있도록 구조 분리
}

// MARK: - 게임 기록 관리
final class GameRecordManager {
    private static var records: [GameRecord] = [] // 모든 게임 기록을 저장하는 배열
    
    static func add(_ record: GameRecord) {
        records.append(record)
    }
    
    static func show() {
        print("< 게임 기록 보기 >")
        if records.isEmpty {
            print("저장된 기록이 없습니다.")
        } else {
            // 저장된 각 게임 기록을 순서대로 출력
            for (index, record) in records.enumerated() {
                print("\(index + 1)번째 게임: 시도 횟수 - \(record.tryCount)")
            }
        }
    }
}
