//
//  BaseballGame.swift
//  Baseball Game
//
//  Created by 김우성 on 5/29/25.
//

import Foundation

class BaseballGame {
    func start() {
        print("< 게임을 시작합니다 >")
        let input = getInput()
        let answer = makeAnswer()
        
        
    }
    
    func makeAnswer() -> [Int] {
        let range = Array(1...9)
        let randomNumbers = Array(range.shuffled().prefix(3))
//        print(randomNumbers)
        return randomNumbers
    }
    
    func getInput() -> [Int] {
        while true {
            print("숫자를 입력하세요")
            let input = readLine() ?? ""
            
            if input.count != 3 { // 세자리 수가 아닌 경우
                print("숫자를 3자리로 입력하세요")
            } else {
                
            }
        }
    }
}
