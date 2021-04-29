//
//  NumericRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` to check if an input (validation) `String` contains at
/// least `nCharacters` uppercase characters.
public struct NumericRule {

    /// Number of character occurrences required
    public var nCharacters: Int

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - nCharacters: `Int` defaulting to `1`
    public init(nCharacters: Int = 1) {
        self.nCharacters = nCharacters
    }
}

// MARK: - CharacterSetRule

extension NumericRule: CharacterSetRule {

    /// - Returns: The `.uppercaseLetters` `CharacterSet`
    public var characterSet: CharacterSet {
        return CharacterSet(charactersIn: .numeric)
    }
}

// MARK: - ValidationRule

extension NumericRule: ValidationRule {

    public var rule: String {
        return "Input must have at least \(nCharacters) numeric character\(nCharacters.s)"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_NUMERIC"
    }
}

// MARK: - String + Numeric

private extension String {

    /// Numeric characters
    static let numeric = "0123456789"
}
