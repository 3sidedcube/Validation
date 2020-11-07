//
//  String+PasswordRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 02/11/2020.
//

/// Define the criteria for a password to be valid
public extension String {

    /// Validate `rules` on `self` returning a filtered array of the `rules` which failed
    ///
    /// - Parameter rules: `[PasswordRule]` to check
    /// - Returns: `[PasswordRule]` which failed
    func validatePassword(with rules: [PasswordRule]) -> [PasswordRule] {
        return rules.filter { !$0.validate(password: self) }
    }

    /// Invoke `validatePassword(with:)` checking the returned failed rules array is empty.
    ///
    /// - Parameter rules: `[PasswordRule]` to check
    /// - Returns: `Bool` `true` if the password is valid according to the given `rules`
    func isValidPassword(with rules: [PasswordRule]) -> Bool {
        return validatePassword(with: rules).isValid
    }
}
