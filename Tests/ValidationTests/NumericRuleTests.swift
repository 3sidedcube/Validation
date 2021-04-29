//
//  NumericRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class NumericRuleTests: XCTestCase {

    func test() {
        XCTAssertFalse("".validate(with: [NumericRule()]).isValid)
        XCTAssertFalse("hello".validate(with: [NumericRule()]).isValid)
        XCTAssertFalse("Scary 😱".validate(with: [NumericRule()]).isValid)
        XCTAssertFalse("That's great 👏".validate(with: [NumericRule()]).isValid)

        XCTAssertTrue("1".validate(with: [NumericRule()]).isValid)
        XCTAssertTrue("Hey 21".validate(with: [NumericRule()]).isValid)
        XCTAssertTrue("10 is awesome 🎉".validate(with: [NumericRule()]).isValid)
        XCTAssertTrue("Let's do 3 3️⃣".validate(with: [NumericRule()]).isValid)
    }
}
