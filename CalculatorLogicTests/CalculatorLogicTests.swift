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
        
        let sum = sut.add("")
        
        #expect(sum == 0)
    }
    
    @Test("Add single digit returns that digit")
    func add_singleDigit_returnsThatDigit() {
        let sut = CalculatorLogic()
        
        let sum = sut.add("1")
        
        #expect(sum == 1)
    }

    @Test("Add double digit number returns that number")
    func add_doubleDigit_returnsThatNumber() {
        let sut = CalculatorLogic()
        
        let sum = sut.add("12")
        
        #expect(sum == 12)
    }
}
