//
//  CalculatorLogicTests.swift
//  CalculatorLogicTests
//
//  Created by Himanshu on 27/06/25.
//

import Testing
@testable import CalculatorLogic

struct CalculatorLogicTests {

    @Test("Add empty string returns 0")
    func add_emptyString_returnsZero() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("")
        
        #expect(sum == 0)
    }
    
    @Test("Add single digit returns that digit")
    func add_singleDigit_returnsThatDigit() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1")
        
        #expect(sum == 1)
    }

    @Test("Add double digit number returns that number")
    func add_doubleDigit_returnsThatNumber() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("12")
        
        #expect(sum == 12)
    }
    
    @Test("Add two numbers returns their sum")
    func add_twoNumbers_returnsTheirSum() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1,2")
        
        #expect(sum == 3)
    }
    
    @Test("Add three numbers returns their sum")
    func add_threeNumbers_returnsTheirSum() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1,2,3")
        
        #expect(sum == 6)
    }
    
    @Test("Add multiple numbers returns their sum")
    func add_multipleNumbers_returnsTheirSum() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1,2,3,4,5")
        
        #expect(sum == 15)
    }
    
    @Test("Add with new lines between numbers return their sum")
    func add_withNewLines_returnsTheirSum() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1\n2\n3")
        
        #expect(sum == 6)
    }
    
    @Test("Add with custom delimter")
    func add_withCustomDelimiter_returnsTheirSum() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("//;\n1;2;3")
        
        #expect(sum == 6)
    }
    
    @Test("Add with negative number throws an error")
    func add_withNegativeNumber_throwsError() {
        let sut = CalculatorLogic()
        
        #expect(throws: CalculatorLogic.Error.negativeNumberEncountered("negative numbers not allowed <-2>")) {
            try sut.add("1,-2")
        }
    }
    
    @Test("Add with multiple negative number throws an error with all the negative numbers")
    func add_withMultipleNegativeNumbers_throwsError() {
        let sut = CalculatorLogic()
        
        #expect(throws: CalculatorLogic.Error.negativeNumberEncountered("negative numbers not allowed <-2,-7>")) {
            try sut.add("1,-2,-7,9,11")
        }
    }
    
    @Test("Ignore numbers greater than 1000")
    func add_ignoreNumbersGreaterThan1000_returnsSumOfSmallerNumbers() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("1,2,1111,4")
        
        #expect(sum == 7)
    }
    
    @Test("Handles delimiters of any length")
    func add_handlesDelimitersOfAnyLength_returnsSumOfNumbers() {
        let sut = CalculatorLogic()
        
        let sum = try? sut.add("//[***]\n1***2***3")
        
        #expect(sum == 6)
    }
}
