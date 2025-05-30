//
//  InputValidator.swift
//  Baseball Game
//
//  Created by 김우성 on 5/30/25.
//

import Foundation

class InputValidator {
    func getValidInput() -> [Int] {
        /// 정상 입력을 받는 함수. 문제없이 세자리 숫자를 입력받으면 정수 배열로 변환해 반환합니다.
        //        /// - 문제
        //        ///     - 입력이 3자리여야 함.
        //        ///     - 모두 숫자여야 함.
        //        ///     - 맨 앞자리는 0이 오지 말아야 함.
        //        ///     - 모든 숫자는 서로 달라야 함.
        while true {
            print("숫자를 입력하세요 : ")
            let input = readLine() ?? ""
            
            let isLengthValid = input.count == 3
            let isAllDigits = input.allSatisfy { $0.isNumber }
            let isFirstNotZero = input.first != "0"
            let isAllUnique = Set(input).count == input.count
            
            if !isLengthValid {
                print("숫자를 3자리로 입력하세요.")
            } else if !isAllDigits {
                print("0에서 9까지의 숫자를 3자리로 입력하세요.")
            } else if !isFirstNotZero {
                print("맨 앞자리에 0이 오는 것은 불가능합니다.")
            } else if !isAllUnique {
                print("서로 다른 숫자를 3자리로 입력하세요.")
            } else {
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
