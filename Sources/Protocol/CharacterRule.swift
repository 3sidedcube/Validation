//
//  CharacterRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// Enumerates the `Character`s in a `String` counting the number of occurrences returning
/// `true` from `validateCharacter(_:)`.
public protocol CharacterRule {

    /// Number of character occurrences required
    var nCharacters: Int { get }

    /// Return if `character` is valid and should pass validation
    ///
    /// - Parameter character: `Character`
    func validateCharacter(_ character: Character) -> Bool
}

// MARK: - Extensions

public extension CharacterRule {

    // MARK: - ValidationRule

    /// Enumerate `string` executing `validateCharacter(_:)` for each `Character`.
    /// If `true` increment an accumulation variable. If that accumulation reaches `nCharacters`
    /// return `true`, otherwise return `false`
    ///
    /// - Parameter string: `String` input
    /// - Returns: Success or failure
    func validate(string: String) -> Bool {
        return string.enumerateCharacters(nOccurrences: nCharacters) {
            return validateCharacter($0)
        }
    }
}
