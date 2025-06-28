//
//  CalculatorLogic.swift
//  CalculatorLogic
//
//  Created by Himanshu on 27/06/25.
//

import Foundation

struct CalculatorLogic {
    
    func add(_ string: String) -> Int {
        if string.isEmpty {
            return 0
        } else {
            let numbers = string.split{ $0 == "," || $0 == "\n" }
            var sum = 0
            for number in numbers {
                sum += Int(number) ?? 0
            }
            return sum
        }
    }
}
