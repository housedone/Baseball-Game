//
//  GamePrinter.swift
//  Baseball Game
//
//  Created by 김우성 on 5/30/25.
//

import Foundation

class GamePrinter {
    /// 메인 메뉴를 출력하는 함수
    func showMainMenu() {
        print("""
                ##############################################
                #            ⚾️ 𝐵𝐴𝑆𝐸𝐵𝐴𝐿𝐿 𝐺𝐴𝑀𝐸                #
                #     환영합니다! 원하시는 메뉴의 번호를 입력해주세요.    #
                #    1. 게임 시작  2. 게임 기록 보기  3. 게임 종료    #
                ##############################################
                """
        )
        print("메뉴 번호 : ", terminator: "")
    }
    
    /// 게임 기록을 출력하는 함수
    func showRecords(_ record: [Int]) {
        print("< 게임 기록 >")
        
        if record.count == 0 {
            print("게임을 플레이한 기록이 없습니다.")
        } else {
            for index in 0..<record.count {
                print("\(index + 1)번째 게임의 시도 횟수: \(record[index])")
            }
        }
    }
    
    /// 게임 결과를 보여주는 함수
    func showGameResult(strike: Int, ball: Int) {
        if strike == 0 && ball == 0 { // 두 카운트가 다 0이면
            print("Nothing")
        } else {
            if strike > 0 { print("\(strike) 스트라이크 ", terminator: "") }
            if ball > 0 { print("\(ball) 볼", terminator: "") }
            print() // 개행용
        }
    }
        
    func winMessage() {
        print("5252 젠장 실화냐고 ㅋㅋ 게임을 깨버린 거냐고")
    }
    
    func sayGoodBye() {
        print("게임을 종료합니다.")
    }
    
    func invalidOptionMessage() {
        print("올바른 번호를 입력해주세요.")
    }
    
    func startGameMessage() {
        print("\n< 새 게임을 시작합니다! >")
    }
}
