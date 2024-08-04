//
//  Reverse_wordsUITests.swift
//  Reverse wordsUITests
//
//  Created by Волошин Нікіта on 19.01.2023.
//
import XCTest

class ReverseWordsUITests: XCTestCase {
    
    
    func testDefaultReverse() {
        let app = XCUIApplication()
        
        app.launch()
        app.textFields["textField"].tap()
        app.textFields["textField"].typeText("My name Bob")
        app.buttons["buttonResult"].tap()
        XCTAssert(app.staticTexts["yM eman boB"].exists)
        
        app.textFields["textField"].typeText("reverse 24/7")
        app.buttons["buttonResult"].tap()
        XCTAssert(app.staticTexts["esrever 24/7"].exists)
    }
    func testCustomReverse() {
        let app = XCUIApplication()
        
        app.launch()
        app.segmentedControls["segmentSwitcher"].buttons["Custom"].tap()
        app.textFields["textField"].tap()
        app.textFields["textField"].typeText("Foxminded cool 24/7")
        app.textFields["customCharsTextField"].tap()
        app.textFields["customCharsTextField"].typeText("xl")
        app.buttons["buttonResult"].tap()
        XCTAssert(app.staticTexts["dexdnimoF oocl 7/42"].exists)
        
        app.textFields["textField"].tap()
        app.textFields["textField"].typeText("reverse 24/7")
        app.textFields["customCharsTextField"].tap()
        app.textFields["customCharsTextField"].typeText("reverse")
        app.buttons["buttonResult"].tap()
        XCTAssert(app.staticTexts["reverse 7/42"].exists)
    }
    
    
}
