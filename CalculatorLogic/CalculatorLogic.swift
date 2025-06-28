//
//  CalculatorLogic.swift
//  CalculatorLogic
//
//  Created by Himanshu on 27/06/25.
//

import Foundation

struct CalculatorLogic {
    
    func add(_ string: String) -> Int {
        guard !string.isEmpty else { return 0 }
        var delimiter: Character = ","
        if string.hasPrefix("//"),
           let newlineIndex = string.firstIndex(of: "\n") {
            delimiter = string[string.index(before: newlineIndex)]
        }
        
        let numbers = string.split{ $0 == delimiter || $0 == "\n" }
        var sum = 0
        for number in numbers {
            sum += Int(number) ?? 0
        }
        return sum
    }
}
