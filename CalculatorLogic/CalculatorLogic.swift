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
 
        let (numbersString, delimiter) = getNumberStringAndDelimiter(for: string)
        
        let numbers = numbersString.split{ $0 == delimiter || $0 == "\n" }
        var sum = 0
        var negativeNumbers: [String] = []
        for number in numbers {
            if let numberAsInt = Int(String(number)) {
                if numberAsInt < 0 {
                    negativeNumbers.append(String(number))
                } else {
                    if numberAsInt > 1_000 {
                        continue
                    }
                    sum += numberAsInt
                }
            }
        }
        
        if negativeNumbers.isEmpty {
            return sum
        } else {
            throw Error.negativeNumberEncountered("negative numbers not allowed <\(negativeNumbers.joined(separator: ","))>")
        }
    }
    
    private func getNumberStringAndDelimiter(for string: String) -> (numbersString: String, delimiter: Character) {
        if string.hasPrefix(("//")) {
            let numbersString = String(string.suffix(from: string.firstIndex(of: "\n") ?? string.startIndex))
            let delimiter = getDelimiter(string)
            return (numbersString, delimiter)
        }
        return (string, ",")
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
