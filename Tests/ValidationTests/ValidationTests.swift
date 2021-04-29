//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 02/11/2020.
//

import XCTest
@testable import Validation

final class ValidationTests: XCTestCase {

    func testValidation1() {
        let password = "Password-123!"
        let failedRules = password.validate(with: [
            MinCountRule(min: 5),
            MaxCountRule(max: 20),
            SpecialCharacterRule(),
            LowercaseRule(),
            UppercaseRule(),
            NumericRule()
        ])

        XCTAssertTrue(failedRules.isValid)
    }

    func testValidation2() {
        let password = "password"
        let failedRules = password.validate(with: [
            MinCountRule(min: 5),
            MaxCountRule(max: 20),
            SpecialCharacterRule(),
            LowercaseRule(),
            UppercaseRule(),
            NumericRule()
        ])

        XCTAssertFalse(failedRules.isValid)
        XCTAssertTrue(failedRules.count == 3)
        XCTAssertTrue(failedRules[0] is SpecialCharacterRule)
        XCTAssertTrue(failedRules[1] is UppercaseRule)
        XCTAssertTrue(failedRules[2] is NumericRule)
    }

    func testValidation3() {
        let password = "!(@$J df😀*($K!JfkΩ "
        let failedRules = password.validate(with: [
            MinCountRule(min: 20),
            MaxCountRule(max: 21),
            SpecialCharacterRule(nCharacters: 6),
            LowercaseRule(nCharacters: 4),
            UppercaseRule(nCharacters: 3),
            NumericRule()
        ])

        XCTAssertFalse(failedRules.isValid)
        XCTAssertTrue(failedRules.count == 2)
        XCTAssertTrue(failedRules[0] is MinCountRule)
        XCTAssertTrue(failedRules[1] is NumericRule)
    }
}
