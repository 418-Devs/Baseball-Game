//
//  BaseballView.swift
//  Baseball Game
//
//  Created by 이태윤 on 5/29/25.
//
import Foundation

class BaseballView {
    
    let controller = BaseballController()

    func run(){
        while true{
            print("1. 게임시작  2. 게임기록. 3. 게임종료")
            controller.inputStatus()

            switch controller.model.stateSelect {
            case 1:
                controller.computerNumber()
                controller.showComNumber()
                while !controller.model.result{
                    controller.userInput()
                    controller.game()
                }
                
            case 2:
                controller.readRecord()
                
            case 3:
                controller.gameExit()
                
            default:
                print("올바른 숫자를 입력해 주세요.")
            }
        }
    }
    
}


