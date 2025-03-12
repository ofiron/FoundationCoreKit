//
//  CyclableEnumTest.swift
//  FoundationCoreKit
//
//  Created by Ofir Ron on 07/03/2025.
//

import Testing
@testable import FoundationCoreKit

struct CyclableEnumTests {
    @Test("Simple enum cycling")
    func testSimpleCycling() {
        #expect(Simple.zero.next() == .one)
        #expect(Simple.zero.next().rawValue == 1)
        
        #expect(Simple.one.next() == .two)
        #expect(Simple.one.next().rawValue == 2)
        
        #expect(Simple.two.next() == .zero)
        #expect(Simple.two.next().rawValue == 0)
    }
    
    @Test("StartAtTen enum cycling")
    func testStartAtTenCycling() {
        #expect(StartAtTen.firstAsTen.next() == .eleven)
        #expect(StartAtTen.firstAsTen.next().rawValue == 11)
        
        #expect(StartAtTen.eleven.next() == .twelve)
        #expect(StartAtTen.eleven.next().rawValue == 12)
        
        #expect(StartAtTen.twelve.next() == .firstAsTen)
        #expect(StartAtTen.twelve.next().rawValue == 10)
    }
    
    @Test("Simple full cycle")
    func testSimpleFullCycle() {
        var current = Simple.zero
        let expectedSequence = [0, 1, 2, 0]
        var actualSequence: [Int] = []
        
        for _ in 0..<4 {
            actualSequence.append(current.rawValue)
            current = current.next()
        }
        
        #expect(actualSequence == expectedSequence)
    }
    
    @Test("StartAtTen full cycle")
    func testStartAtTenFullCycle() {
        var current = StartAtTen.firstAsTen
        let expectedSequence = [10, 11, 12, 10]
        var actualSequence: [Int] = []
        
        for _ in 0..<4 {
            actualSequence.append(current.rawValue)
            current = current.next()
        }
        
        #expect(actualSequence == expectedSequence)
    }
    
    @Test("All cases existence")
    func testAllCases() {
        #expect(Simple.allCases.count == 3)
        #expect(StartAtTen.allCases.count == 3)
        
        #expect(Simple.allCases.contains(.zero))
        #expect(Simple.allCases.contains(.one))
        #expect(Simple.allCases.contains(.two))
        
        #expect(StartAtTen.allCases.contains(.firstAsTen))
        #expect(StartAtTen.allCases.contains(.eleven))
        #expect(StartAtTen.allCases.contains(.twelve))
    }
    
    @Test("Single case enum behavior")
    func testSingleCaseEnum() {
        enum Single: Int, CyclableEnum {
            case only = 0
        }
        
        #expect(Single.only.next() == .only)
    }
    
    @Test("Non-consecutive enum cycling")
    func testNonConsecutiveCycling() {
        enum NonConsecutive: Int, CyclableEnum {
            case zero = 0
            case two = 2
            case four = 4
        }

        #expect(NonConsecutive.zero.next() == .two)
        #expect(NonConsecutive.two.next() == .four)
        #expect(NonConsecutive.four.next() == .zero)
    }
    
    @Test("Negative values enum cycling")
    func testNegativeValuesCycling() {
        enum NegativeValues: Int, CyclableEnum {
            case minusTwo = -2
            case minusOne = -1
            case zero = 0
        }

        #expect(NegativeValues.minusTwo.next() == .minusOne)
        #expect(NegativeValues.minusOne.next() == .zero)
        #expect(NegativeValues.zero.next() == .minusTwo)
    }
    
    @Test("Large enum cycling")
    func testLargeEnumCycling() {
        enum LargeEnum: Int, CyclableEnum {
            case zero, one, two, three, four, five, six, seven, eight, nine, ten
        }

        var current = LargeEnum.zero
        for _ in 0..<LargeEnum.allCases.count {
            current = current.next()
        }
        #expect(current == .zero)
    }
    
    @Test("Custom raw values enum cycling")
    func testCustomRawValuesCycling() {
        enum CustomRawValues: Int, CyclableEnum {
            case firstIsHundred = 100
            case secondIsTwoHundreds = 200
            case thirdIsThreeHundreds = 300
        }

        #expect(CustomRawValues.firstIsHundred.next() == .secondIsTwoHundreds)
        #expect(CustomRawValues.secondIsTwoHundreds.next() == .thirdIsThreeHundreds)
        #expect(CustomRawValues.thirdIsThreeHundreds.next() == .firstIsHundred)
    }
    
    @Test("Custom Crazy raw values enum cycling")
    func testCustomCrazyRawValuesCycling() {
        enum CustomCrazyRawValues: Int, CyclableEnum {
            case firstIsHundred = 100
            case secondIsTwo = 2
            case thirdIsMinusTwo = -2
        }

        #expect(CustomCrazyRawValues.firstIsHundred.next() == .secondIsTwo)
        #expect(CustomCrazyRawValues.secondIsTwo.next() == .thirdIsMinusTwo)
        #expect(CustomCrazyRawValues.thirdIsMinusTwo.next() == .firstIsHundred)
    }
    
    @Test("String enum cycling")
    func testStringEnumCycling() {
        enum StringEnum: String, CyclableEnum {
            case first = "first"
            case second = "second"
            case third = "third"
        }
        
        #expect(StringEnum.first.next() == .second)
        #expect(StringEnum.second.next() == .third)
        #expect(StringEnum.third.next() == .first)
    }
    
    @Test("Double enum cycling")
    func testDoubleEnumCycling() {
        enum DoubleEnum: Double, CyclableEnum {
            case low = 0.1
            case medium = 0.5
            case high = 1.0
        }
        
        #expect(DoubleEnum.low.next() == .medium)
        #expect(DoubleEnum.medium.next() == .high)
        #expect(DoubleEnum.high.next() == .low)
    }

    @Test("Character enum cycling")
    func testCharacterEnumCycling() {
        enum CharacterEnum: Character, CyclableEnum {
            case a = "A"
            case b = "B"
            case c = "C"
        }
        
        #expect(CharacterEnum.a.next() == .b)
        #expect(CharacterEnum.b.next() == .c)
        #expect(CharacterEnum.c.next() == .a)
    }

    @Test("Custom raw value enum cycling")
    func testCustomRawValueEnumCycling() {
        enum CustomEnum: String, CyclableEnum {
            case first = "customFirst"
            case second = "customSecond"
            case third = "customThird"
        }
        
        #expect(CustomEnum.first.next() == .second)
        #expect(CustomEnum.second.next() == .third)
        #expect(CustomEnum.third.next() == .first)
    }
}

extension CyclableEnumTests {
    enum Simple: Int, CyclableEnum {
        case zero  // 0
        case one   // 1
        case two  // 2
    }
    
    enum StartAtTen: Int, CyclableEnum {
        case firstAsTen = 10
        case eleven    // 11
        case twelve    // 12
    }
}
