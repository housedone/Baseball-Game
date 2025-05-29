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
    
    func start() {
        /// 게임 메인 메뉴를 보여주고, 번호를 입력받아 해당 기능을 불러오는 함수
        var option: Int
        
        while true {
            print("##############################################")
            print("#            ⚾️ 𝐵𝐴𝑆𝐸𝐵𝐴𝐿𝐿 𝐺𝐴𝑀𝐸                #")
            print("#     환영합니다! 원하시는 항목의 번호를 입력해주세요.    #")
            print("#    1. 게임 시작  2. 게임 기록 보기  3. 게임 종료    #")
            print("##############################################")
            
            option = Int(readLine() ?? "") ?? 0
            
            switch option {
            case 1:
                gameTryCount.append(playGame())
            case 2:
                showRecord(record: gameTryCount)
            case 3:
                print("게임을 종료합니다.")
                exit(0)
            default :
                print("올바른 번호를 입력해주세요.")
            }
        }
    }
    
    func showRecord(record: [Int]) {
        /// 게임 기록 보기 함수.
        print("< 게임 기록 보기 >")
        
        if record.count == 0 {
            print("게임을 플레이한 기록이 없습니다.")
        } else {
            for i in 0..<record.count {
                print("\(i+1)번째 게임의 시도 횟수: \(record[i])")
            }
        }
    }
    
    func playGame() -> Int {
        /// 게임 플레이 함수. 정답 배열을 준비하고, 게임 승리 변수가 true가 될 때까지 정상 입력을 받아 비교하며, 정상 입력을 받은 횟수를 반환합니다.
        var strikeCount = 0
        var ballCount = 0
        var isGameWin: Bool = false
        var playCount = 0
        
        print("\n< 새 게임을 시작합니다! >")
        let answer = makeAnswer() // 정답 배열 준비
        var input: [Int] // 올바른 입력값을 받을 배열 준비
        
        while !isGameWin {
            input = getInput()
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
                isGameWin = true
                print("5252 젠장 실화냐고 ㅋㅋ 게임을 깨버린 거냐고")
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
    
    func getInput() -> [Int] {
        /// 정상 입력을 받는 함수. 문제없이 세자리 숫자를 입력받으면 정수 배열로 변환해 반환합니다.
        /// - 문제
        ///     - 입력이 3자리여야 함.
        ///     - 모두 숫자여야 함.
        ///     - 맨 앞자리는 0이 오지 말아야 함.
        ///     - 모든 숫자는 서로 달라야 함.
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
