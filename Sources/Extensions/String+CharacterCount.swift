//
//  String+CharacterCount.swift
//  Validation
//
//  Created by Ben Shutt on 07/11/2020.
//

import Foundation

/// Unicode scalar in a `String`
internal typealias UnicodeScalar = String.UnicodeScalarView.Element

// MARK: - String

internal extension String {

    /// Execute `unicodeScalars.enumerateAndCount(nOccurrences:closure:)`
    /// executing `closure` for each `UnicodeScalar`
    ///
    /// - Parameters:
    ///   - nOccurrences: `Int` Number of occurrences to attain
    ///   - closure: Closure to execute for each `UnicodeScalar`
    func enumerateUnicodeScalars(
        nOccurrences: Int,
        closure: (UnicodeScalar) -> Bool
    ) -> Bool {
        return unicodeScalars.enumerateAndCount(
            nOccurrences: nOccurrences,
            closure: closure
        )
    }

    /// Execute `enumerateAndCount(nOccurrences:closure:)` executing
    /// `closure` for each `Character`
    ///
    /// - Parameters:
    ///   - nOccurrences: `Int` Number of occurrences to attain
    ///   - closure: Closure to execute for each `Character`
    func enumerateCharacters(
        nOccurrences: Int,
        closure: (Character) -> Bool
    ) -> Bool {
        return enumerateAndCount(
            nOccurrences: nOccurrences,
            closure: closure
        )
    }
}

// MARK: - Sequence

internal extension Sequence {

    /// Enumerate `elements`. For each element, execute `closure`.
    /// If `closure` returns `true` then increment a counter.
    /// If the counter, after incrementing, equals `nOccurrences` return `true`.
    /// Return `false` if the counter never reached `nOccurrences`.
    /// If `nOccurrences <= 0` return `true`.
    ///
    /// - Parameters:
    ///   - nOccurrences: `Int` Number of occurrences to attain
    ///   - closure: Closure to execute for each `T` in `elements`
    func enumerateAndCount(
        nOccurrences: Int,
        closure: (Element) -> Bool
    ) -> Bool {
        // If 0 or less return `true` by default
        if nOccurrences <= 0 {
            return true
        }

        // Accumulation of occurrences to increment
        var count = 0

        // Iterate characters
        for unicodeScalar in self {

            // Check if the character is valid
            if closure(unicodeScalar) {

                // Success, increment accumulation
                count += 1
            }

            // Break with success
            if count >= nOccurrences {

                // Success
                return true
            }
        }

        // Failure
        return false
    }
}
