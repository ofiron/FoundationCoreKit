//
//  StringOptionalEmptyTests.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import XCTest
@testable import FoundationCoreKit

// MARK: - is Nil or Empty
final class StringOptionalEmpty_isNilOrEmptyTests: XCTestCase {

    // MARK: - Test Cases
    
    func testNilOptional_IsNilOrEmptyReturnsTrue() {
        // Given
        let string: String? = nil
        
        // Then
        XCTAssertTrue(string.isNilOrEmpty, "Nil optional should return true")
    }
    
    func testEmptyString_IsNilOrEmptyReturnsTrue() {
        // Given
        let string: String? = ""
        
        // Then
        XCTAssertTrue(string.isNilOrEmpty, "Empty string should return true")
    }
    
    func testNonEmptyString_IsNilOrEmptyReturnsFalse() {
        // Given
        let string: String? = "Hello World"
        
        // Then
        XCTAssertFalse(string.isNilOrEmpty, "Non-empty string should return false")
    }
    
    func testWhitespaceString_IsNilOrEmptyReturnsFalse() {
        // Given
        let string: String? = "   "
        
        // Then
        XCTAssertFalse(string.isNilOrEmpty,
                       "Whitespace-only string should return false (not considered empty)")
    }
    
    func testEmptyAfterTrim_IsNilOrEmptyReturnsFalse() {
        // Given
        let string: String? = "   "
        let trimmed = string?.trimmingCharacters(in: .whitespaces)
        
        // When
        let result = trimmed.isNilOrEmpty
        
        // Then
        XCTAssertTrue(result,
                      "String that becomes empty after trimming should return true only if stored as empty")
    }
}

// MARK: - non empty string
class StringOptionalEmpty_NonEmptyStringTests: XCTestCase {

    func testNonEmpty_withNonEmptyString_returnsSelf() {
        let testString = "  Hello World  "
        let result = testString.nonEmpty
        XCTAssertEqual(result, testString, "Expected nonEmpty to return the original string when it is not empty after trimming.")
    }

    func testNonEmpty_withEmptyString_returnsNil() {
        let testString = ""
        let result = testString.nonEmpty
        XCTAssertNil(result, "Expected nonEmpty to return nil for an empty string.")
    }

    func testNonEmpty_withWhitespaceOnlyString_returnsNil() {
        let testString = "    \n\t  "
        let result = testString.nonEmpty
        XCTAssertNil(result, "Expected nonEmpty to return nil for a string with only whitespace and newlines.")
    }

    func testNonEmpty_withLeadingAndTrailingWhitespace_returnsSelf() {
        let testString = "\n  Data  \n"
        let result = testString.nonEmpty
        XCTAssertEqual(result, testString, "Expected nonEmpty to return the original string when trimming results in a non-empty string.")
    }

    func testNonEmpty_withStringContainingOnlyNewlines_returnsNil() {
        let testString = "\n"
        let result = testString.nonEmpty
        XCTAssertNil(result, "Expected nonEmpty to return nil when string contains only newlines.")
    }

    func testNonEmpty_withStringContainingOnlySpaces_returnsNil() {
        let testString = "     "
        let result = testString.nonEmpty
        XCTAssertNil(result, "Expected nonEmpty to return nil when string contains only spaces.")
    }

    func testNonEmpty_withString_withNoWhitespace_returnsSelf() {
        let testString = "NoWhitespace"
        let result = testString.nonEmpty
        XCTAssertEqual(result, testString, "Expected nonEmpty to return the original string when no whitespace is present.")
    }
}

// Mark: - Non Empty (Optional)
class StringOptionalEmpty_nonEmptyOptionalTests: XCTestCase {
    
    func testNonEmpty_withNonEmptyString() {
        let string: String? = "  Hello  "
        XCTAssertEqual(string.nonEmpty, "  Hello  ")
    }
    
    func testNonEmpty_withStringOnlyWhitespace() {
        let string: String? = "    "
        XCTAssertNil(string.nonEmpty)
    }
    
    func testNonEmpty_withEmptyString() {
        let string: String? = ""
        XCTAssertNil(string.nonEmpty)
    }
    
    func testNonEmpty_withNil() {
        let string: String? = nil
        XCTAssertNil(string.nonEmpty)
    }
    
    func testNonEmpty_withStringWithNewlines() {
        let string: String? = "\nHello"
        XCTAssertEqual(string.nonEmpty, "\nHello")
    }
    
    func testNonEmpty_withStringThatBecomesEmptyAfterTrim() {
        let string: String? = "\n\n"
        XCTAssertNil(string.nonEmpty)
    }
}

