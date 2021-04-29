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
        XCTAssertTrue("hello".validate(with: [LowercaseRule()]).isValid)
        XCTAssertTrue("here is more words".validate(with: [LowercaseRule()]).isValid)
        XCTAssertTrue("TeST 1".validate(with: [LowercaseRule()]).isValid)
        XCTAssertTrue("10 is awesome 🎉".validate(with: [LowercaseRule()]).isValid)

        XCTAssertFalse("".validate(with: [LowercaseRule()]).isValid)
        XCTAssertFalse("HELLO".validate(with: [LowercaseRule()]).isValid)
        XCTAssertFalse("1".validate(with: [LowercaseRule()]).isValid)
        XCTAssertFalse("😱".validate(with: [LowercaseRule()]).isValid)
    }
}
