//
//  CalculatorViewModel.swift
//  Test
//
//  Created by Akhilesh Singh on 26/03/21.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit

/*
 ((5 - 7) * 8) + 3
 
 + * - 5 7 8 3
 
 (5 -7)
 (-2 * 8)
 -16 + 3
 
 */

class CalculatorViewModel {
   
    func calculateValue(values: String) -> Int {
        let values = Array(values)
        var numbers = [Int]()
        var operationList = [Character]()
        var index = 0
        while index < values.count {
            let currentValue = values[index]
            if currentValue == "-" && (index == 0 || values[index-1] == "(") {
                numbers.append(0)
            }
            if currentValue.isNumber {
                var num = 0
                while index < values.count && values[index].isNumber {
                    num = num * 10 + Int(String(values[index]))!
                    index += 1
                }
                numbers.append(num)
                index -= 1
            } else if currentValue == "(" {
                operationList.append("(")
            } else if currentValue == ")" {
                while operationList.count > 0 && operationList.last! != "(" {
                    let operation = operationList.removeLast()
                    let lastValue = numbers.removeLast()
                    let secondLastValue = numbers.removeLast()
                    numbers.append(calculate(operation, lastValue, secondLastValue))
                }
                operationList.removeLast()
            } else {
                while operationList.count > 0 && checkIfExist(currentValue, operationList.last!) {
                    let operation = operationList.removeLast()
                    let lastValue = numbers.removeLast()
                    let secondLastValue = numbers.removeLast()
                    numbers.append(calculate(operation, lastValue, secondLastValue))
                }
                operationList.append(currentValue)
            }
            index += 1
        }
        
        while operationList.count > 0 {
            let operation = operationList.removeLast()
            let lastValue = numbers.removeLast()
            let secondLastValue = numbers.removeLast()
            numbers.append(calculate(operation, lastValue, secondLastValue))
        }
        return numbers.last!
    }
    
    func calculate(_ operation: Character, _ lastValue: Int, _ secondLastValue: Int) -> Int {
        if operation == "+" {
            return lastValue + secondLastValue
        } else if operation == "-" {
            return secondLastValue - lastValue
        } else if operation == "*" {
            return lastValue * secondLastValue
        } else {
            return secondLastValue / lastValue
        }
    }
    
    func checkIfExist(_ firstChar: Character, _ secondChar: Character) -> Bool {
        if secondChar == "(" {
            return false
        }
        if (secondChar == "+" || secondChar == "-") && (firstChar == "*" || firstChar == "/") {
            return false
        }
        return true
    }
    
}
