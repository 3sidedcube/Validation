//
//  SpecialCharacterRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

import Foundation

/// `ValidationRule` checking if a given entity has a sufficient number of special characters.
/// Specifically, assert `string` contains at least `nCharacters` special characters.
public class SpecialCharacterRule: CharacterSetRule {

    /// Initialize with `nCharacters` using `String.specialCharacters` for `characterSet`
    ///
    /// - Parameters:
    ///   - nCharacters: `Int` defaulting to 1
    ///   - string: `String` special characters as a `String`
    public init(
        nCharacters: Int = 1,
        charactersIn string: String = .specialCharacters
    ) {
        super.init(
            nCharacters: nCharacters,
            characterSet: CharacterSet(charactersIn: string)
        )
    }

    // MARK: - ValidationRule

    override public var rule: String {
        return "Input must have at least \(nCharacters) special character\(nCharacters.s)"
    }

    override public var localizationKey: String {
        return "_VALIDATION_RULE_SPECIAL_CHARACTER"
    }
}

// MARK: - String + SpecialCharacters

public extension String {

    /// Default special characters
    static let specialCharacters = ",./?<>!@£$%^&*()-_=+{}[]'\"\\|`~"
}
