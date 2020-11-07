//
//  LowercaseRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `PasswordRule` checking if a given password has a sufficient number of lowercase characters.
/// Specifically, assert `password` contains at least `nCharacters` lowercase characters.
public class LowercaseRule: CharacterSetRule {

    /// Initialize with `nCharacters` using `.lowercaseLetters` for `characterSet`
    ///
    /// - Parameter nCharacters: `Int` defaulting to 1
    public init(nCharacters: Int = 1) {
        super.init(
            nCharacters: nCharacters,
            characterSet: .lowercaseLetters
        )
    }

    // MARK: - PasswordRule

    public override var rule: String {
        return "Password must have at least \(nCharacters) lowercase character\(nCharacters.s)"
    }

    public override var localizationKey: String {
        return "_PASSWORD_RULE_LOWERCASE"
    }
}
