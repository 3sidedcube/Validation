import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PasswordValidationTests.allTests)
    ]
}
#endif
