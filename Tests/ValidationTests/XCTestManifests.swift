//
//  MinCountRuleTests.swift
//  ValidationTests
//
//  Created by Ben Shutt on 02/11/2020.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LowercaseRuleTests.allTests),
        testCase(MaxCountRuleTests.allTests),
        testCase(MinCountRuleTests.allTests),
        testCase(NumericRuleTests.allTests),
        testCase(RegexRuleTests.allTests),
        testCase(RuleTestsTests.allTests),
        testCase(SpecialCharacterRuleTests.allTests),
        testCase(UppercaseRuleTests.allTests),

        testCase(ValidationTests.allTests)
    ]
}
#endif
