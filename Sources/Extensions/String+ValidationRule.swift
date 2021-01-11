//
//  String+ValidationRule.swift
//  Validation
//
//  Created by Ben Shutt on 02/11/2020.
//

public extension String {

    /// Validate `rules` on `self` returning a filtered array of the `rules` which failed
    ///
    /// - Parameter rules: `[ValidationRule]` to check
    /// - Returns: `[ValidationRule]` which failed
    func validate(with rules: [ValidationRule]) -> [ValidationRule] {
        return rules.filter { !$0.validate(string: self) }
    }

    /// Invoke `validate(with:)` checking the returned failed rules array is empty.
    ///
    /// - Parameter rules: `[ValidationRule]` to check
    /// - Returns: `Bool` `true` if the entity is valid according to the given `rules`
    func isValid(with rules: [ValidationRule]) -> Bool {
        return validate(with: rules).isValid
    }
}
