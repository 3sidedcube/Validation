//
//  Collection+ValidationRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

// MARK: - Collection + ValidationRule

public extension Collection where Element == ValidationRule {

    /// An entity is considered valid when it contains no failed `ValidationRule`s
    var isValid: Bool {
        return isEmpty
    }
}
