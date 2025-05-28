//
//  main.swift
//  Baseball Game
//
//  Created by 이태윤 on 5/28/25.
//

import Foundation

let controller = BaseballController()

controller.computerNumber()
controller.showComNumber()
while !controller.model.result{
    controller.userInput()
    controller.game()
}


