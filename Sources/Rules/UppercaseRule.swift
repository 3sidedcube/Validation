//
//  UppercaseRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` checking if a given entity has a sufficient number of uppercase characters.
/// Specifically, assert `string` contains at least `nCharacters` uppercase characters.
public class UppercaseRule: CharacterSetRule {

    /// Initialize with `nCharacters` using `.uppercaseLetters` for `characterSet`
    ///
    /// - Parameter nCharacters: `Int` defaulting to 1
    public init(nCharacters: Int = 1) {
        super.init(
            nCharacters: nCharacters,
            characterSet: .uppercaseLetters
        )
    }

    // MARK: - ValidationRule

    public override var rule: String {
        return "Input must have at least \(nCharacters) uppercase character\(nCharacters.s)"
    }

    public override var localizationKey: String {
        return "_VALIDATION_RULE_UPPERCASE"
    }
}
