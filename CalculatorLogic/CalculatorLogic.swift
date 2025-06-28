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
 
        let (numbersString, delimiters) = getNumberStringAndDelimiter(for: string)
        let numbers = getNumbersFrom(numberString: numbersString, separatedBy: delimiters)
        
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
    
    private func getNumberStringAndDelimiter(for string: String) -> (numbersString: String, delimiter: [String]) {
        if string.hasPrefix(("//")) {
            let numbersString = String(string.suffix(from: string.firstIndex(of: "\n") ?? string.startIndex))
            let delimiter = getDelimiter(string)
            return (numbersString, delimiter)
        }
        return (string, [","])
    }
    
    private func getNumbersFrom(numberString: String, separatedBy delimiters: [String]) -> [String] {
        let escaped = delimiters.map(NSRegularExpression.escapedPattern(for:))
        let pattern = escaped.joined(separator: "|") + "|\n"
        
        let regex = try! NSRegularExpression(pattern: pattern)
        
        let unified = regex.stringByReplacingMatches(
            in: numberString,
            options: [],
            range: NSRange(location: 0, length: numberString.utf16.count),
            withTemplate: ","
        )
        return unified.split(separator: ",").map(String.init)
    }
    
    private func getDelimiter(_ string: String) -> [String] {
        var delimiters: [String] = []
        if let newlineIndex = string.firstIndex(of: "\n") {
            let pattern = #"\[([^\[\]]+)\]"#
            if let regex = try? NSRegularExpression(pattern: pattern) {
                let matches = regex.matches(in: string, range: NSRange(string.startIndex..., in: string))
               delimiters = matches.compactMap {
                    Range($0.range(at: 1), in: string).map { String(string[$0]) }
                }
            }
            if delimiters.isEmpty {
                let delimiter = string[string.index(before: newlineIndex)]
                delimiters.append(String(delimiter))
            }
            return delimiters
        }
        return [","]
    }
    
    enum Error: Swift.Error, Equatable {
        case negativeNumberEncountered(String)
    }
}
