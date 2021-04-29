//
//  LowercaseRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class LowercaseRuleTests: XCTestCase {

    func test() {
        let rule = LowercaseRule()

        XCTAssertTrue("hello".validate(with: [rule]).isValid)
        XCTAssertTrue("here is more words".validate(with: [rule]).isValid)
        XCTAssertTrue("TeST 1".validate(with: [rule]).isValid)
        XCTAssertTrue("10 is awesome 🎉".validate(with: [rule]).isValid)

        XCTAssertFalse("".validate(with: [rule]).isValid)
        XCTAssertFalse("HELLO".validate(with: [rule]).isValid)
        XCTAssertFalse("1".validate(with: [rule]).isValid)
        XCTAssertFalse("😱".validate(with: [rule]).isValid)
    }
}
