//
//  UppercaseRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `PasswordRule` checking if a given password has a sufficient number of uppercase characters.
/// Specifically, assert `password` contains at least `nCharacters` uppercase characters.
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

    // MARK: - PasswordRule

    public override var rule: String {
        return "Password must have at least \(nCharacters) uppercase character\(nCharacters.s)"
    }

    public override var localizationKey: String {
        return "_PASSWORD_RULE_UPPERCASE"
    }
}
