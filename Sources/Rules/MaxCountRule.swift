//
//  MaxCountRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `ValidationRule` to check if a given `String` has less than or equal to the `max`
/// number of characters.
public struct MaxCountRule {

    /// Maximum number of characters required for the entity to be valid.
    /// 
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

    /// Ensure `count` of the given `string` is less than or equal to `max`.
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
