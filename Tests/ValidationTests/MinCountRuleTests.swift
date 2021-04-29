//
//  MinCountRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class MinCountRuleTests: XCTestCase {

    func testNumberString() {
        let string = "12345"

        XCTAssertTrue(string.validate(with: [MinCountRule(min: 1)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 4)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 5)]).isValid)

        XCTAssertFalse(string.validate(with: [MinCountRule(min: 6)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 7)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 10)]).isValid)
    }

    func testRandomString() {
        let string = "Random String"

        XCTAssertTrue(string.validate(with: [MinCountRule(min: 1)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 12)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 13)]).isValid)

        XCTAssertFalse(string.validate(with: [MinCountRule(min: 14)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 15)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 100)]).isValid)
    }

    func testEmoji() {
        let string = "hello 😃"

        XCTAssertTrue(string.validate(with: [MinCountRule(min: 1)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 6)]).isValid)
        XCTAssertTrue(string.validate(with: [MinCountRule(min: 7)]).isValid)

        XCTAssertFalse(string.validate(with: [MinCountRule(min: 8)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 9)]).isValid)
        XCTAssertFalse(string.validate(with: [MinCountRule(min: 10)]).isValid)
    }
}
