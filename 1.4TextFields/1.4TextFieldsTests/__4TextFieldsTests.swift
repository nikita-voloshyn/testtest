//
//  __4TextFieldsTests.swift
//  1.4TextFieldsTests
//
//  Created by Волошин Нікіта on 10.02.2023.
//

import XCTest
@testable import __4TextFields

final class __4TextFieldsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var validator = textValidation()
        var examples: Array =  [
            ["asd", "https://asd"],
            ["https://asd.com", "https://asd.com"],
            ["", "https://"],
            ["https:/", "https://"],]
        for example in examples {
            XCTAssertEqual(validator.link(example.first ?? ""), example.last ?? "")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
