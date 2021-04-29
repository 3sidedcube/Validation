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
        let rule = SpecialCharacterRule()

        XCTAssertTrue("*".validate(with: [rule]).isValid)
        XCTAssertTrue("Hello!".validate(with: [rule]).isValid)
        XCTAssertTrue("(test)".validate(with: [rule]).isValid)
        XCTAssertTrue("Boom<🎉>".validate(with: [rule]).isValid)

        XCTAssertFalse("".validate(with: [rule]).isValid)
        XCTAssertFalse("Hello".validate(with: [rule]).isValid)
        XCTAssertFalse("1".validate(with: [rule]).isValid)
        XCTAssertFalse("😱".validate(with: [rule]).isValid)
    }

    func testGivenSet() {
        let rule = SpecialCharacterRule(
            characterSet: CharacterSet(charactersIn: "🚀")
        )

        XCTAssertTrue("🚀".validate(with: [rule]).isValid)
        XCTAssertTrue("Rocket 🚀 fire".validate(with: [rule]).isValid)

        XCTAssertFalse("Hello".validate(with: [rule]).isValid)
        XCTAssertFalse("Test!".validate(with: [rule]).isValid)
        XCTAssertFalse("!@£$%^&*()_+{}'\\/<>?~`<,.".validate(with: [rule]).isValid)
        XCTAssertFalse("😱".validate(with: [rule]).isValid)
        XCTAssertFalse("Can it be 🎉".validate(with: [rule]).isValid)
    }
}
