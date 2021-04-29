//
//  MaxCountRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class MaxCountRuleTests: XCTestCase {

    func testNumberString() {
        let string = "12345"

        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 1)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 3)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 4)]).isValid)

        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 5)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 6)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 10)]).isValid)
    }

    func testRandomString() {
        let string = "Random String"

        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 1)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 11)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 12)]).isValid)

        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 13)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 14)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 100)]).isValid)
    }

    func testEmoji() {
        let string = "hello 😃"

        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 1)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 5)]).isValid)
        XCTAssertFalse(string.validate(with: [MaxCountRule(max: 6)]).isValid)

        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 7)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 8)]).isValid)
        XCTAssertTrue(string.validate(with: [MaxCountRule(max: 10)]).isValid)
    }
}
