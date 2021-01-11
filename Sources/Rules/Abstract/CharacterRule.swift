//
//  CharacterRule.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

// MARK: - CharacterRuleAbstract

/// Abstract methods in `CharacterRule`
public protocol CharacterRuleAbstract: ValidationRule {

    /// Return if `character` is valid and should pass validation
    ///
    /// - Parameter character: `Character`
    func validateCharacter(_ character: Character) -> Bool
}

// MARK: - CharacterRule

/// A `ValidationRule` which enumerates the `Character`s in a `String` counting
/// the number of occurances of characters returning `true` from `validateCharacter(_:)`.
///
/// - Warning:
/// This class is abstract, subclasses should implement the abstract methods.
///
/// - Note:
/// `validateCharacter()` is abstract and should be overridden in the subclass.
public class CharacterRule: CharacterRuleAbstract {

    /// Number of character occurrences required
    public var nCharacters: Int

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - nCharacters: `Int`
    public init(nCharacters: Int = 1) {
        self.nCharacters = nCharacters
    }

    // MARK: - Abstract

    /// Subclasses should define whether `character` is valid
    public func validateCharacter(_ character: Character) -> Bool {
        fatalError("Abstract")
    }

    /// Subclasses should define what the `characterSet` represents
    public var rule: String {
        fatalError("Abstract")
    }

    /// Subclasses should define a localisation key for their `rule`
    public var localizationKey: String {
        fatalError("Abstract")
    }

    // MARK: - ValidationRule

    /// Enumerate `string` executing `validateCharacter(_:)` for each `Character`.
    /// If `true` increment an accumulation variable. If that accumulation reaches `nCharacters`
    /// return `true`, otherwise return `false`
    ///
    /// - Parameter string: `String` input
    /// - Returns: Success or failure
    public func validate(string: String) -> Bool {
        return string.enumerateCharacters(nOccurrences: nCharacters) {
            return validateCharacter($0)
        }
    }
}
