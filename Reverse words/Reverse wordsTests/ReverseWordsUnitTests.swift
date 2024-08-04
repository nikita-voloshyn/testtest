//
//  MyProjectTests.swift
//  Reverse wordsTests
//
//  Created by Волошин Нікіта on 19.01.2023.
//

import XCTest
@testable import Reverse_words

class ReverseWordsUnitTests: XCTestCase {
    let reverseManager = ReverseManager()
    
    func testDefaultReverseWithOutСharacter() {
        
        let expectedResult = "yM eman boB"
        let systemTested = reverseManager.reverseWithCustomChars("My name Bob", ignoreCustomChars: true)
        
        XCTAssertEqual(systemTested, expectedResult)
    }
    
    func testDefaultReverseWithСharacter(){
        let  expectedResult = "esrever 24/7"
        let  systemTested = reverseManager.reverseWithCustomChars("reverse 24/7", ignoreCustomChars: true)
        
        XCTAssertEqual(systemTested, expectedResult)
    }
    
    
    func testCustomReverseWithShortTextToIgnire() {
        
        let expectedResult = "dexdnimoF oocl 7/42"
        let textToIgnoreIn = "xl"
        let fullText = "Foxminded cool 24/7"
        let systemTested = reverseManager.reverseWithCustomChars(fullText, textToIgnoreIn, ignoreCustomChars: false)
        
        XCTAssertEqual(systemTested, expectedResult)
    }
    
    func testCustomReverseWithLongTextToIgnire() {
        let expectedResult = "reverse 7/42"
        let textToIgnoreIn = "reverse"
        let fullText = "reverse 24/7"
        let systemTested = reverseManager.reverseWithCustomChars(fullText, textToIgnoreIn, ignoreCustomChars: false)
        
        XCTAssertEqual(systemTested, expectedResult)
        
    }
    
}

