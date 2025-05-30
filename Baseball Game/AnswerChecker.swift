//
//  AnswerChecker.swift
//  Baseball Game
//
//  Created by 김우성 on 5/30/25.
//

import Foundation

class AnswerChecker {
    /// 정답을 만드는 함수.
    /// 0에서 9까지의 수 중 중복 없이 3개를 뽑아 정수 배열로 반환합니다.
    /// 맨 앞자리에는 0을 허용하지 않습니다.
    func makeAnswer() -> [Int] {
        var digits = Array(0...9).shuffled() // 0에서 9까지 있는 배열을 섞음
        
        if digits[0] == 0 { // 맨 앞자리가 0이면 두번째랑 바꿈
            digits.swapAt(0, 1)
        }
        
        return Array(digits.prefix(3))
    }

    func pointCount(input: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        var strike = 0
        var ball = 0
        
        for i in 0..<input.count {
            if input[i] == answer[i] { // 같은 배열 자리에 동일한 숫자 있는 경우
                strike += 1
            } else if answer.contains(input[i]) { // 그건 아닌데 같은 게 포함된 것이 있는 경우
                ball += 1
            }
        }
        
        return (strike, ball)
    }
}
