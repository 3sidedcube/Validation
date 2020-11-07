//
//  RegexRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `PasswordRule` checking if a regular expression passes for a given password.
/// Specifically assert there exists a range of the `regex` in `password`.
public class RegexRule {

    /// Pattern to be evaluated against a given password.
    /// If there exists a `Range` of this `regex` in the given password then we consider the pass
    /// the rule.
    public var regex: String

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - regex: `String`
    public init(regex: String) {
        self.regex = regex
    }
}

// MARK: - PasswordRule

extension RegexRule: PasswordRule {

    /// Ensure there is a range for `regex` in the given `password`
    ///
    /// - Parameter password: `String` password
    public func validate(password: String) -> Bool {
        return password.range(of: regex, options: .regularExpression) != nil
    }

    public var rule: String {
        return "Password failed the validation rule"
    }

    public var localizationKey: String {
        return "_PASSWORD_RULE_REGEX"
    }
}
