//
//  BaseballGame.swift
//  Baseball Game
//
//  Created by 김우성 on 5/29/25.
//

import Foundation

class BaseballGame {
    var gameTryCount: [Int] = [] // 게임 시도 횟수 카운터 배열 전역변수
    private let printer = GamePrinter()
    private let inputValidator = InputValidator()
    private let answerChecker = AnswerChecker()
    
    /// 메뉴 번호를 입력받아 해당하는 기능을 불러오는 함수.
    func start() {
        while true {
            printer.showMainMenu()
            let option = Int(readLine() ?? "") ?? 0
            
            switch option {
            case 1:
                gameTryCount.append(playGame())
            case 2:
                printer.showRecords(gameTryCount)
            case 3:
                printer.sayGoodBye()
                return
            default :
                printer.invalidOptionMessage()
            }
        }
    }
    
    /// 게임 플레이 함수.
    /// 정답이 나올 때까지 올바른 입력값을 받은 횟수를 반환합니다.
    private func playGame() -> Int {
        let answer = answerChecker.makeAnswer() // 정답 배열 준비
        var playCount = 0
        
        printer.startGameMessage()
        
        while true {
            let input = inputValidator.getValidInput() // 올바른 입력값을 받을 배열 준비
            playCount += 1
            
//            /// 디버깅용
//            print(answer)
//            print(input)
            
            let (strike, ball) = answerChecker.pointCount(input: input, answer: answer)
            printer.showGameResult(strike: strike, ball: ball)
            
            if strike == 3 {
                printer.winMessage()
                return playCount
            }
        }
    }
}
