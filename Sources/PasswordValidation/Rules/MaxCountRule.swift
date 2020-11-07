//
//  MaxCountRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `PasswordRule` for checking if a given password has less than or equal to the `max`
/// number of characters requirement.
/// Specifically, assert `password.count <= max` is satisfied.
public struct MaxCountRule {

    /// Maximum number of characters required for the password to be valid.
    /// This value is **inclusive**.
    public var max: Int

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - max: `Int`
    public init(max: Int) {
        self.max = max
    }
}

// MARK: - PasswordRule

extension MaxCountRule: PasswordRule {

    /// Ensure `count` of the given `password` is greater than or equal to `min`.
    ///
    /// - Parameter password: `String` password
    public func validate(password: String) -> Bool {
        return password.count <= max
    }

    public var rule: String {
        return "Password must have at most \(max) character\(max.s)"
    }

    public var localizationKey: String {
        return "_PASSWORD_RULE_MAX"
    }
}
