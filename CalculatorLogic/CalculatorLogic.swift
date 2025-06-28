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
            let numbers = string.split(separator: ",")
            if numbers.count == 1 {
                return Int(numbers[0]) ?? 0
            } else {
                return (Int(numbers[0]) ?? 0) + (Int(numbers[1]) ?? 0)
            }
        }
    }
}
