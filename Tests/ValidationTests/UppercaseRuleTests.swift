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
        XCTAssertTrue("Hello".validate(with: [UppercaseRule()]).isValid)
        XCTAssertTrue("HELLO THERE".validate(with: [UppercaseRule()]).isValid)
        XCTAssertTrue("TeST 1".validate(with: [UppercaseRule()]).isValid)
        XCTAssertTrue("Found one 🤞".validate(with: [UppercaseRule()]).isValid)

        XCTAssertFalse("".validate(with: [UppercaseRule()]).isValid)
        XCTAssertFalse("hello".validate(with: [UppercaseRule()]).isValid)
        XCTAssertFalse("here is more words".validate(with: [UppercaseRule()]).isValid)
        XCTAssertFalse("10 is awesome 🎉".validate(with: [UppercaseRule()]).isValid)
    }
}
