//
//  CharacterSetRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

/// A `ValidationRule` checking if a given entity has a sufficient number of characters
/// (or unicode scalars) from a given `CharacterSet`.
///
/// Specifically, assert `string` contains at least `nCharacters` from `characterSet`.
///
/// - Warning:
/// This class is abstract, subclasses should implement the abstract methods.
///
/// - Note:
/// In the context of `CharacterSet` we talk about `UnicodeScalarView`s
/// rather than `Character`s
public class CharacterSetRule: ValidationRule {

    /// Number of character occurrences required
    public var nCharacters: Int

    /// `CharacterSet` to count occurrences from
    public var characterSet: CharacterSet

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - nCharacters: `Int`
    ///   - characterSet: `CharacterSet`
    public init(
        nCharacters: Int = 1,
        characterSet: CharacterSet
    ) {
        self.nCharacters = nCharacters
        self.characterSet = characterSet
    }

    /// Initialize with `nCharacters` and `string`.
    /// `characterSet` will be created from `string`
    ///
    /// - Parameters:
    ///   - nCharacters: `Int`
    ///   - string: `String`
    convenience init(
        nCharacters: Int = 1,
        charactersIn string: String
    ) {
        self.init(
            nCharacters: nCharacters,
            characterSet: CharacterSet(charactersIn: string)
        )
    }

    // MARK: - ValidationRule

    public func validate(string: String) -> Bool {
        return string.enumerateUnicodeScalars(nOccurrences: nCharacters) {
            return characterSet.contains($0)
        }
    }

    // MARK: - Abstract

    /// Subclasses should define what the `characterSet` represents
    public var rule: String {
        fatalError("Abstract")
    }

    /// Subclasses should define a localisation key for their `rule`
    public var localizationKey: String {
        fatalError("Abstract")
    }
}
