//
//  BaseballGame.swift
//  Baseball Game
//
//  Created by 김우성 on 5/29/25.
//

import Foundation

class BaseballGame {
    func start() {
        // LV4 안내문구 삽입하기
        
        print("< 게임을 시작합니다 >")
        let answer = makeAnswer() // 정답 배열 준비
        let input = getInput() // 올바른 입력값 배열 준비
        print(answer)
        print(input)
        
        
    }
    
    // 1에서 9까지의 수 중 중복 없이 3개를 뽑아 숫자 배열로 리턴하는 함수
    func makeAnswer() -> [Int] {
        let range = Array(1...9)
        
        // range 배열을 순서를 섞어 앞에서 세개만 뽑은 배열
        let randomNumbers = Array(range.shuffled().prefix(3))
        //        print(randomNumbers)
        return randomNumbers
    }
    
    // 세자리 숫자를 문제없이 입력받는지 확인한 후 숫자 배열로 리턴하는 함수
    
    
    
    
    
    func getInput() -> [Int] {
        var inputHasProblem: Bool
        
        while true {
            inputHasProblem = false
            
            print("숫자를 입력하세요 : ")
            let input = readLine() ?? ""
            
            // 세자리 수가 아닌 경우 e.g. 1234
            if input.count != 3 {
                print("숫자를 3자리로 입력하세요.")
                inputHasProblem = true
            }
            // 입력값이 숫자가 아닌 경우 e.g. dfg
            if input.contains(where: { !"0123456789".contains($0) }) {
                print("0에서 9까지의 숫자를 3자리로 입력하세요.")
                inputHasProblem = true
            }
//            // 숫자에 0을 넣은 경우 e.g. 103
//            if input.contains("0") {
//                print("0을 포함해 입력하지 마세요.")
//                inputHasProblem = true
//            }
            // 숫자의 첫째 자리가 0인 경우 e.g. 092
            if input.first == "0" {
                print("맨 앞자리에 0이 오는 것은 불가능합니다.")
                inputHasProblem = true
            }
            // 같은 숫자가 두 번 이상 들어간 경우 e.g. 199
            if input.count != Set(input).count {
                print("서로 다른 숫자를 3자리로 입력하세요.")
                inputHasProblem = true
            }
            // 문제 없는 경우, 세자리 숫자로 이루어진 문자열을
            if !inputHasProblem {
//                print("세자리네요. 잘했습니다.")
                return input.compactMap { $0.wholeNumberValue }
                // input은 문자열이다. 즉, 문자의 배열이다.
                // $0은 배열의 각 값으로, 여기서는 input 문자열의 각 문자(Char)이다.
                // .wholeNumberValue는 Character의 정수 값을 반환한다. (없으면 nil)
                // .compactMap은 컬렉션의 각 요소에 대해 맵핑을 시도한다.
                //   .map과 달리, nil은 제거하고, 옵셔널이 아닌 값만 모아 리턴한다.
                // Int(String($0))과 같은 방법도 있다.
                //   좀 더 느리므로 숫자를 하나하나 추출하기보다 문자열 전체에서 숫자를 파싱할 때 쓰면 좋다.
            }
        }
    }
}
