//
//  Int+Extensions.swift
//  Validation
//
//  Created by Ben Shutt on 04/11/2020.
//

import Foundation

internal extension Int {

    /// Prepare for the plural in certain English contexts.
    /// Return `"s"` if `self != 1`, otherwise empty `String`.
    ///
    /// - Warning:
    /// The plural of a word isn't always suffixed with an s, e.g. "country" -> "countries".
    var s: String {
        return self == 1 ? "" : "s"
    }
}
