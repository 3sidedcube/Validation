import XCTest
@testable import PasswordValidation

/// TODO - Add test for each rule
final class PasswordValidationTests: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
    }

    func testPasswordValidation_1() {
        let password = "Password-123!"
        let failedRules = password.validatePassword(with: [
            MinCountRule(min: 5),
            MaxCountRule(max: 20),
            SpecialCharacterRule(),
            LowercaseRule(),
            UppercaseRule(),
            NumericRule()
        ])

        XCTAssertTrue(failedRules.isValid)
    }

    func testPasswordValidation_2() {
        let password = "password"
        let failedRules = password.validatePassword(with: [
            MinCountRule(min: 5),
            MaxCountRule(max: 20),
            SpecialCharacterRule(),
            LowercaseRule(),
            UppercaseRule(),
            NumericRule()
        ])

        XCTAssertFalse(failedRules.isValid)
        XCTAssertTrue(failedRules.count == 3)
        XCTAssertTrue(failedRules[0] is SpecialCharacterRule)
        XCTAssertTrue(failedRules[1] is UppercaseRule)
        XCTAssertTrue(failedRules[2] is NumericRule)
    }

    func testPasswordValidation_3() {
        let password = "!(@$J df😀*($K!JfkΩ "
        let failedRules = password.validatePassword(with: [
            MinCountRule(min: 20),
            MaxCountRule(max: 21),
            SpecialCharacterRule(nCharacters: 6),
            LowercaseRule(nCharacters: 4),
            UppercaseRule(nCharacters: 3),
            NumericRule()
        ])

        XCTAssertFalse(failedRules.isValid)
        XCTAssertTrue(failedRules.count == 2)
        XCTAssertTrue(failedRules[0] is MinCountRule)
        XCTAssertTrue(failedRules[1] is NumericRule)
    }
}
