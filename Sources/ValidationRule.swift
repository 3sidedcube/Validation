//
//  ValidationRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// A condition or requirement which a given `String` must pass.
///
/// It's common for an entity to have multiple `ValidationRule`s which are checked.
/// An entity is considered valid when all `ValidationRule`s pass.
public protocol ValidationRule {

    /// Validate the given `string`.
    /// Return `true` for pass and `false` for fail.
    ///
    /// - Parameter string: `String` to check
    func validate(string: String) -> Bool

    /// Describe the rule and what is required for it to pass.
    var rule: String { get }

    /// Localization key for `rule`
    var localizationKey: String { get }
}

// MARK: - ValidationRule + Extensions

public extension ValidationRule {

    /// Localized reason for failure as a `String` using `localizationKey` and `rule`
    var localizedFailure: String {
        return .localize(localizationKey, value: rule)
    }
}
