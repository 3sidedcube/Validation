//
//  CharacterSetRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// Enumerates the `Character`s in a `String` counting the number of occurrences
/// which `characterSet` contains.
///
/// - Note:
/// In the context of `CharacterSet` we talk about `UnicodeScalarView`s
/// rather than `Character`s
public protocol CharacterSetRule {

    /// Number of character occurrences required
    var nCharacters: Int { get }

    /// `CharacterSet` to count occurrences from
    var characterSet: CharacterSet { get }
}

// MARK: - Extensions

public extension CharacterSetRule {

    // MARK: - ValidationRule

    /// Enumerate `string` checking if the `characterSet` contains each `Character`.
    /// If `true` increment an accumulation variable. If that accumulation reaches `nCharacters`
    /// return `true`, otherwise return `false`
    ///
    /// - Parameter string: `String` input
    /// - Returns: Success or failure
    func validate(string: String) -> Bool {
        return string.enumerateUnicodeScalars(nOccurrences: nCharacters) {
            return characterSet.contains($0)
        }
    }
}
