//
//  LowercaseRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` to check if an input (validation) `String` contains at
/// least `nCharacters` lowercase characters.
public struct LowercaseRule {

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

extension LowercaseRule: CharacterSetRule {

    /// - Returns: The `.lowercaseLetters` `CharacterSet`
    public var characterSet: CharacterSet {
        return .lowercaseLetters
    }
}

// MARK: - ValidationRule

extension LowercaseRule: ValidationRule {

    public var rule: String {
        return "Input must have at least \(nCharacters) lowercase character\(nCharacters.s)"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_LOWERCASE"
    }
}
