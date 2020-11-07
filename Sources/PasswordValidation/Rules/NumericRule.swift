//
//  NumericRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// `PasswordRule` checking if a given password has a sufficient number of numeric characters.
/// Specifically, assert `password` contains at least `nCharacters` numeric characters.
public class NumericRule: CharacterSetRule {

    /// Initialize with `nCharacters` using `String.numeric` for `characterSet`
    ///
    /// - Parameter nCharacters: `Int` defaulting to 1
    init(nCharacters: Int = 1) {
        super.init(
            nCharacters: nCharacters,
            characterSet: CharacterSet(charactersIn: .numeric)
        )
    }

    // MARK: - PasswordRule

    public override var rule: String {
        return "Password must have at least \(nCharacters) numeric character\(nCharacters.s)"
    }

    public override var localizationKey: String {
        return "_PASSWORD_RULE_NUMERIC"
    }
}

// MARK: - String + Numeric

private extension String {

    /// Numeric characters
    static let numeric = "0123456789"
}
