//
//  EnterResultViewModelTests.swift
//  Numbers
//
//  Created by Hao Zheng on 9/7/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import XCTest
import Bond
@testable import Numbers

class EnterResultViewModelTests: XCTestCase {
    
    let vm = EnterResultViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConfirm() {
        let randomUtil = RandomNumbers()
        
        var correctString = randomUtil.randomNumberForDigits(23)
        var inputString = ""
        
        self.vm.confirm((correctString, inputString))
        XCTAssertEqual(self.vm.resultLabelText.value.string, "Please enter your result", "Not expected..")
        
        inputString = correctString
        self.vm.confirm((correctString, inputString))
        XCTAssertEqual(self.vm.resultLabelText.value.string, "Congrat! You got the right answer!", "Not expected..")
        
        //
        correctString = randomUtil.randomNumberForDigits(201)
        inputString = correctString
        self.vm.confirm((correctString, inputString))
        XCTAssertEqual(self.vm.resultLabelText.value.string, "Congrat! You got the right answer!", "Not expected..")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
