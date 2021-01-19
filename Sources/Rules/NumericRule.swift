//
//  NumericRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` checking if a given entity has a sufficient number of numeric characters.
/// Specifically, assert `string` contains at least `nCharacters` numeric characters.
public class NumericRule: CharacterSetRule {

    /// Initialize with `nCharacters` using `String.numeric` for `characterSet`
    ///
    /// - Parameter nCharacters: `Int` defaulting to 1
    public init(nCharacters: Int = 1) {
        super.init(
            nCharacters: nCharacters,
            characterSet: CharacterSet(charactersIn: .numeric)
        )
    }

    // MARK: - ValidationRule

    override public var rule: String {
        return "Input must have at least \(nCharacters) numeric character\(nCharacters.s)"
    }

    override public var localizationKey: String {
        return "_VALIDATION_RULE_NUMERIC"
    }
}

// MARK: - String + Numeric

private extension String {

    /// Numeric characters
    static let numeric = "0123456789"
}
