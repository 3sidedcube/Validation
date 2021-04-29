//
//  RegexRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` checking if a regular expression passes for a given entity.
/// Specifically assert there exists a range of the `regex` in `string`.
public struct RegexRule {

    /// Pattern to be evaluated against a given entity.
    /// If there exists a `Range` of this `regex` in the given entity then we consider the pass
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

// MARK: - ValidationRule

extension RegexRule: ValidationRule {

    /// Ensure there is a range for `regex` in the given `string`
    ///
    /// - Parameter string: `String` input
    public func validate(string: String) -> Bool {
        return string.range(of: regex, options: .regularExpression) != nil
    }

    public var rule: String {
        return "Input failed the validation rule"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_REGEX"
    }
}
