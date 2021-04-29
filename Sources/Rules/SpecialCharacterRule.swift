//
//  SpecialCharacterRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `ValidationRule` checking if a given entity has a sufficient number of special characters.
/// Specifically, assert `string` contains at least `nCharacters` special characters.
public struct SpecialCharacterRule {

    /// Number of character occurrences required
    public var nCharacters: Int

    /// `CharacterSet` to count occurrences from
    public var characterSet: CharacterSet

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - nCharacters: `Int` defaulting to `1`
    ///   - characterSet: `CharacterSet` defaulting to `.specialCharacters`
    public init(
        nCharacters: Int = 1,
        characterSet: CharacterSet = .specialCharacters
    ) {
        self.nCharacters = nCharacters
        self.characterSet = characterSet
    }
}

// MARK: - CharacterSetRule

extension SpecialCharacterRule: CharacterSetRule {
}

// MARK: - ValidationRule

extension SpecialCharacterRule: ValidationRule {

    public var rule: String {
        return "Input must have at least \(nCharacters) special character\(nCharacters.s)"
    }

    public var localizationKey: String {
        return "_VALIDATION_RULE_SPECIAL_CHARACTER"
    }
}

// MARK: - String + SpecialCharacters

private extension String {

    /// Default `String` for special characters
    static let specialCharacters = ",./?<>!@£$%^&*()-_=+{}[]'\"\\|`~"
}

// MARK: - CharacterSet + SpecialCharacters

public extension CharacterSet {

    /// Default `CharacterSet` for special characters
    static let specialCharacters = CharacterSet(charactersIn: .specialCharacters)
}
