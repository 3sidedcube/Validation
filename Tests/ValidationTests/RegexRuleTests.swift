//
//  RegexRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class RegexRuleTests: XCTestCase {

    func testAlphaNumerics() {
        let rule = RegexRule(regex: "^[a-zA-Z0-9]*$")

        XCTAssertTrue("".validate(with: [rule]).isValid)
        XCTAssertTrue("hello".validate(with: [rule]).isValid)
        XCTAssertTrue("123456789".validate(with: [rule]).isValid)
        XCTAssertTrue("Test12".validate(with: [rule]).isValid)

        XCTAssertFalse("Over 10".validate(with: [rule]).isValid)
        XCTAssertFalse("4 is awesome".validate(with: [rule]).isValid)
        XCTAssertFalse("Hey!".validate(with: [rule]).isValid)
        XCTAssertFalse("<xml>".validate(with: [rule]).isValid)
        XCTAssertFalse("Emoji 😱".validate(with: [rule]).isValid)
    }
}
