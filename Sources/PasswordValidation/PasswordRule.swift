//
//  PasswordRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// A condition or requirement which a given password must pass.
///
/// It's common for a password to have multiple `PasswordRule`s which are checked.
/// A password is considered valid when all `PasswordRule`s pass.
public protocol PasswordRule {

    /// Validate the given `password`.
    /// Return `true` for pass and `false` for fail.
    ///
    /// - Parameter password: `String` password to check
    func validate(password: String) -> Bool

    /// Describe the rule and what is required for it to pass.
    var rule: String { get }

    /// Localization key for `rule`
    var localizationKey: String { get }
}

// MARK: - PasswordRule + Extensions

public extension PasswordRule {

    /// Localized reason for failure as a `String` using `localizationKey` and `rule`
    var localizedFailure: String {
        return .localize(localizationKey, value: rule)
    }
}
