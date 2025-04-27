//
//  String+Optional+Empty.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

extension String {
    /// Returns an optional string that is `self` if it is not empty after trimming whitespace and newlines,
    /// or `nil` if the trimmed string is empty.
    ///
    /// - Note: This property trims the string and checks if the resulting string is empty.
    ///   If it is empty, it returns `nil`; otherwise, it returns the original string (`self`).
    ///
    /// - Returns: An optional `String`. The original string if non-empty after trimming, or `nil`.
    ///
    /// - Example:
    ///   ```
    ///   let str1 = "  Hello  "
    ///   print(str1.nonEmpty) // Optional("  Hello  ")
    ///
    ///   let str2 = "    "
    ///   print(str2.nonEmpty) // nil
    ///   ```
    public var nonEmpty: String? {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : self
    }
}

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
    public var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
    
    /// Returns an optional string that is `self` if it is not nil and not empty after trimming whitespace and newlines,
    /// or `nil` if the string is nil or the trimmed string is empty.
    ///
    /// - Returns: An optional `String` that is non-empty after trimming, or `nil`.
    ///
    /// - Example:
    ///   ```
    ///   let str1: String? = "  Hello  "
    ///   print(str1.nonEmpty) // Optional("  Hello  ")
    ///
    ///   let str2: String? = "    "
    ///   print(str2.nonEmpty) // nil
    ///
    ///   let str3: String? = nil
    ///   print(str3.nonEmpty) // nil
    ///   ```
    public var nonEmpty: String? {
        guard let string = self else { return nil }
        return string.nonEmpty
    }
}
