//
//  CyclableEnum.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 07/03/2025.
//

/// A protocol that defines an enum which can cycle through its cases in a deterministic order.
///
/// Enums conforming to `CyclableEnum` must be `RawRepresentable` and `CaseIterable`.
/// This allows the enum to provide a `next()` method that returns the next case in the sequence,
/// wrapping around to the first case after the last.
///
/// - Note: The `next()` method relies on the order of cases provided by `CaseIterable`.
///         If the enum has no cases, the `next()` method will return the current value.
///
/// ## Example
/// ```swift
/// enum Simple: String, CyclableEnum {
///     case zero = "zero"
///     case one = "one"
///     case two = "two"
/// }
///
/// let current = Simple.zero
/// let nextCase = current.next() // Returns `.one`
/// ```
public protocol CyclableEnum: RawRepresentable, CaseIterable where RawValue: Equatable { }

extension CyclableEnum {
    /// Returns the next case in the sequence of the enum's cases.
    ///
    /// This method cycles through the cases in the order defined by `CaseIterable`.
    /// If the current case is the last in the sequence, the method wraps around to the first case.
    ///
    /// - Returns: The next case in the sequence. If the enum has no cases, the current value is returned.
    ///
    /// ## Example
    /// ```swift
    /// enum Simple: String, CyclableEnum {
    ///     case zero = "zero"
    ///     case one = "one"
    ///     case two = "two"
    /// }
    ///
    /// let current = Simple.two
    /// let nextCase = current.next() // Returns `.zero`
    /// ```
    public func next() -> Self {
        let allCases = Self.allCases
        guard let currentIndex = allCases.firstIndex(where: { $0.rawValue == self.rawValue }),
              !allCases.isEmpty else {
            return self // Return current value if something goes wrong
        }
        
        let nextIndex = allCases.index(after: currentIndex) == allCases.endIndex ?
        allCases.startIndex :
        allCases.index(after: currentIndex)
        return allCases[nextIndex]
    }
}
