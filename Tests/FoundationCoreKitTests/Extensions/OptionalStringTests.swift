//
//  OptionalStringTests.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import XCTest
@testable import FoundationCoreKit

final class OptionalStringTests: XCTestCase {

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
