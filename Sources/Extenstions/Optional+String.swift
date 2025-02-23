//
//  Optional+String.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

extension Optional where Wrapped == String {
    
    /// A Boolean value indicating whether this optional string is either `nil` or an empty string.
    ///
    /// This property returns `true` if:
    /// - The optional is `nil`
    /// - The wrapped string is empty (contains no characters)
    ///
    /// - Example:
    /// ```swift
    /// let name: String? = nil
    /// print(name.isNilOrEmpty)  // true
    ///
    /// let emptyString: String? = ""
    /// print(emptyString.isNilOrEmpty)  // true
    ///
    /// let nonEmptyString: String? = "Hello"
    /// print(nonEmptyString.isNilOrEmpty)  // false
    /// ```
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}
