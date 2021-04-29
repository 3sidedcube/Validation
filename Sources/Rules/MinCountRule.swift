//
//  MinCountRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `ValidationRule` to check if a given `String` has greater than or equal to the `min`
/// number of characters.
public struct MinCountRule {

    /// Minimum number of characters required for the entity to be valid.
    /// 
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

// MARK: - ValidationRule

extension MinCountRule: ValidationRule {

    /// Ensure `count` of the given `string` is greater than or equal to `min`.
    ///
    /// - Parameter string: `String` input
    public func validate(string: String) -> Bool {
        return string.count >= min
    }

    public var rule: String {
        return "Input must be have least \(min) character\(min.s)"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_MIN"
    }
}
