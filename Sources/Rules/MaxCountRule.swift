//
//  MaxCountRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `ValidationRule` for checking if a given entity has less than or equal to the `max`
/// number of characters requirement.
/// Specifically, assert `string.count <= max` is satisfied.
public struct MaxCountRule {

    /// Maximum number of characters required for the entity to be valid.
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

// MARK: - ValidationRule

extension MaxCountRule: ValidationRule {

    /// Ensure `count` of the given `string` is greater than or equal to `min`.
    ///
    /// - Parameter string: `String` input
    public func validate(string: String) -> Bool {
        return string.count <= max
    }

    public var rule: String {
        return "Input must have at most \(max) character\(max.s)"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_MAX"
    }
}
