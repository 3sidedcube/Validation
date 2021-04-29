//
//  SpecialCharacterRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class SpecialCharacterRuleTests: XCTestCase {

    func test() {
        XCTAssertTrue("*".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertTrue("Hello!".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertTrue("(test)".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertTrue("Boom<🎉>".validate(with: [LowercaseRule()]).isValid)

        XCTAssertFalse("".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertFalse("Hello".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertFalse("1".validate(with: [SpecialCharacterRule()]).isValid)
        XCTAssertFalse("😱".validate(with: [SpecialCharacterRule()]).isValid)
    }
}
