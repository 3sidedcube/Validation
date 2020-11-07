//
//  String+Localisation.swift
//  PasswordValidation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

internal extension String {

    /// Invoke `localizedString(forKey:value:table:)` on `bundle` with the
    /// given parameters. Default values are provided for `bundle` and `table`.
    ///
    /// - Parameters:
    ///   - key: `String` The key for a string in the table identified by tableName.
    ///   - value: `String` The value to return if key is nil or if a localized string for key can’t
    ///   be found in the table.
    ///   - table: `String?` The receiver’s string table to search. If tableName is nil or is
    ///   an empty string, the method attempts to use the table in Localizable.strings.
    ///
    /// - Returns:
    /// A localised `String`
    static func localize(
        _ key: String,
        value: String?,
        bundle: Bundle = .main,
        table: String? = nil
    ) -> String {
        return bundle.localizedString(
            forKey: key,
            value: value,
            table: table
        )
    }
}
