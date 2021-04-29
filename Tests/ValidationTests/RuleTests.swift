//
//  RuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 29/04/2021.
//

import XCTest
@testable import Validation

final class RuleTests: XCTestCase {

    /// Assert the `.localizationKey` on all `ValidationRule`s is unique
    func testLocalisationKeys() {
        let rules: [ValidationRule] = [
            LowercaseRule(),
            MaxCountRule(max: 1),
            MinCountRule(min: 1),
            NumericRule(),
            RegexRule(regex: "[a-fA-F0-9]"),
            SpecialCharacterRule(),
            UppercaseRule()
        ]

        let set = Set(rules.map { $0.localizationKey })
        XCTAssertEqual(set.count, rules.count)
    }
}
