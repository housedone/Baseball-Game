//
//  BaseballGame.swift
//  Baseball Game
//
//  Created by 김우성 on 5/29/25.
//
// LV1 완
// LV2 완
// LV3 완
// LV4 완
// LV5 아직
// LV6 진행


import Foundation

class BaseballGame {
    var gameTryCount: [Int] = [] // 게임 시도 횟수 카운터 배열 전역변수
    private let printer = GamePrinter()
    private let inputValidator = InputValidator()
    
    func start() {
        /// 게임 메인 메뉴를 보여주고, 번호를 입력받아 해당 기능을 불러오는 함수
        
        
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
    
    private func playGame() -> Int {
        /// 게임 플레이 함수. 정답 배열을 준비하고, 게임 승리 변수가 true가 될 때까지 정상 입력을 받아 비교하며, 정상 입력을 받은 횟수를 반환합니다.
        let answer = makeAnswer() // 정답 배열 준비
        var playCount = 0
        
        printer.startGameMessage()
        
        while true {
            var strikeCount = 0
            var ballCount = 0
            
            let input = inputValidator.getValidInput() // 올바른 입력값을 받을 배열 준비
            playCount += 1
            
            /// 디버깅용
            print(answer)
            print(input)
            
            for i in 0..<input.count {
                if answer[i] == input[i] { // 같은 배열 자리에 동일한 숫자 있는 경우
                    strikeCount += 1
                } else if answer.contains(input[i]) { // 그건 아닌데 같은 게 포함된 것이 있는 경우
                    ballCount += 1
                }
            }
            
            if strikeCount == 0 && ballCount == 0 { // 두 카운트가 다 0이면
                print("Nothing")
            } else {
                if strikeCount > 0 { print("\(strikeCount) 스트라이크 ", terminator: "") }
                if ballCount > 0 { print("\(ballCount) 볼", terminator: "") }
                print() // 개행용
            }
            
            if strikeCount == 3 {
                printer.winMessage()
                return playCount
            }
            
            strikeCount = 0
            ballCount = 0
        }
    }
    
    func makeAnswer() -> [Int] {
        /// 정답을 만드는 함수. 0에서 9까지의 수 중 중복 없이 3개를 뽑아 정수 배열로 반환합니다.
        let range = Array(1...9)
        
        // range 배열을 순서를 섞어 앞에서 세개만 뽑은 배열
        let randomNumbers = Array(range.shuffled().prefix(3))
        //        print(randomNumbers)
        return randomNumbers
    }
}

