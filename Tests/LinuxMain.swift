import XCTest

import PasswordValidationTests

var tests = [XCTestCaseEntry]()
tests += PasswordValidationTests.allTests()
XCTMain(tests)
