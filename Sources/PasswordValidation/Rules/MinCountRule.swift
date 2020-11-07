//
//  MinCountRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `PasswordRule` for checking if a given password has greater than or equal to the `min`
/// number of characters requirement.
/// Specifically, assert `password.count >= min` is satisfied.
public struct MinCountRule {

    /// Minimum number of characters required for the password to be valid.
    /// This value is **inclusive**.
    public var min: Int

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - min: `Int`
    public init(min: Int) {
        self.min = min
    }
}

// MARK: - PasswordRule

extension MinCountRule: PasswordRule {

    /// Ensure `count` of the given `password` is greater than or equal to `min`.
    ///
    /// - Parameter password: `String` password
    public func validate(password: String) -> Bool {
        return password.count >= min
    }

    public var rule: String {
        return "Password must be have least \(min) character\(min.s)"
    }

    public var localizationKey: String {
        return "_PASSWORD_RULE_MIN"
    }
}
