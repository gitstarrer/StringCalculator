//
//  CalculatorLogic.swift
//  CalculatorLogic
//
//  Created by Himanshu on 27/06/25.
//

import Foundation

public struct CalculatorLogic {
    
    public func add(_ string: String) throws -> Int {
        guard !string.isEmpty else { return 0 }
        var numbersString = string
        var delimiter: Character = ","
        if string.hasPrefix(("//")) {
            numbersString = String(string.suffix(from: string.firstIndex(of: "\n") ?? string.startIndex))
            delimiter = getDelimiter(string)
        }
        
        let numbers = numbersString.split{ $0 == delimiter || $0 == "\n" }
        var sum = 0
        for number in numbers {
            guard let numberAsInt = Int(number), numberAsInt >= 0 else {
              throw Error.negativeNumberEncountered("negative numbers not allowed <\(number)>")
            }
            sum += numberAsInt
        }
        return sum
    }
    
    private func getDelimiter(_ string: String) -> Character {
        if let newlineIndex = string.firstIndex(of: "\n") {
            let delimiter = string[string.index(before: newlineIndex)]
            return delimiter
        }
        return ","
    }
    
    enum Error: Swift.Error, Equatable {
        case negativeNumberEncountered(String)
    }
}
