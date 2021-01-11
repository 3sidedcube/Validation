//
//  LowercaseRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `ValidationRule` checking if a given entity has a sufficient number of lowercase characters.
/// Specifically, assert `string` contains at least `nCharacters` lowercase characters.
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

    // MARK: - ValidationRule

    override public var rule: String {
        return "Input must have at least \(nCharacters) lowercase character\(nCharacters.s)"
    }

    override public var localizationKey: String {
        return "_VALIDATION_RULE_LOWERCASE"
    }
}
