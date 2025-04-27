//
//  UncommonError.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/04/2025.
//

/// An error type representing uncommon or unexpected failures within the package.
///
/// `UncommonError` defines errors that are not expected to occur under normal circumstances,
/// but may happen due to environmental issues (e.g., missing directories, invalid system states).
///
/// - Note: Designed for rare or unexpected conditions that should be handled explicitly.
///
/// Example usage:
/// ```swift
/// throw UncommonError.documentDirectoryNotFound
/// ```
public enum UncommonError: Error, CustomStringConvertible {
    
    /// Indicates that the document directory could not be located on the file system.
    case documentDirectoryNotFound

    /// A human-readable description of the error.
    public var description: String {
        switch self {
        case .documentDirectoryNotFound:
            return "The document directory could not be found."
        }
    }
}
