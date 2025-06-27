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
    func add_emptyString_returnsZero() async throws {
        let sut = CalculatorLogic()
        
        let sum = sut.add("")
        
        #expect(sum == 0)
    }

}
