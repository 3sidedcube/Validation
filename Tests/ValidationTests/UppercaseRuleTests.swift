//
//  UppercaseRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class UppercaseRuleTests: XCTestCase {

    func test() {
        let rule = UppercaseRule()

        XCTAssertTrue("Hello".validate(with: [rule]).isValid)
        XCTAssertTrue("HELLO THERE".validate(with: [rule]).isValid)
        XCTAssertTrue("TeST 1".validate(with: [rule]).isValid)
        XCTAssertTrue("Found one 🤞".validate(with: [rule]).isValid)

        XCTAssertFalse("".validate(with: [rule]).isValid)
        XCTAssertFalse("hello".validate(with: [rule]).isValid)
        XCTAssertFalse("here is more words".validate(with: [rule]).isValid)
        XCTAssertFalse("10 is awesome 🎉".validate(with: [rule]).isValid)
    }
}
