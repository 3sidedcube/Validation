//
//  Collection+PasswordRule.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

// MARK: - Collection + PasswordRule

public extension Collection where Element == PasswordRule {

    /// A password is considered valid when it contains no failed `PasswordRule`s
    var isValid: Bool {
        return isEmpty
    }
}
