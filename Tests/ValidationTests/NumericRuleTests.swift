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
        let rule = NumericRule()

        XCTAssertTrue("1".validate(with: [rule]).isValid)
        XCTAssertTrue("Hey 21".validate(with: [rule]).isValid)
        XCTAssertTrue("10 is awesome 🎉".validate(with: [rule]).isValid)
        XCTAssertTrue("Let's do 3 3️⃣".validate(with: [rule]).isValid)

        XCTAssertFalse("".validate(with: [rule]).isValid)
        XCTAssertFalse("hello".validate(with: [rule]).isValid)
        XCTAssertFalse("Scary 😱".validate(with: [rule]).isValid)
        XCTAssertFalse("That's great 👏".validate(with: [rule]).isValid)
    }
}
