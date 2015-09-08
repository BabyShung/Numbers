//
//  RandomNumberViewModelTests.swift
//  Numbers
//
//  Created by Hao Zheng on 9/7/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import XCTest
import Bond
@testable import Numbers

class RandomNumberViewModelTests: XCTestCase {
    
    var vm = RandomNumberViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLengthOfNumbers() {
        let array = [26, 52, 80, 150, 200]
        for index in array {
            self.vm.digitNumbers = index
            helperStartTimer()
            helperStopTimer()
        }
    }
    
    func helperStartTimer() {
        self.vm.startTimer()
        XCTAssertFalse(self.vm.startButtonEnabled.value,"start btn should be disabled")
        XCTAssertTrue(self.vm.stopButtonEnabled.value,"stop btn should be enabled")
        XCTAssertFalse(self.vm.randomNumberLabelHidden.value,"label should be hidden")
        
        let str = self.vm.randomNumberText.value
        XCTAssertEqual(str.characters.count, self.vm.digitNumbers, "length should be inconsistent")
    }
    
    func helperStopTimer() {
        self.vm.stopTimer()
        XCTAssertTrue(self.vm.startButtonEnabled.value,"start btn should be enabled")
        XCTAssertFalse(self.vm.stopButtonEnabled.value,"stop btn should be disabled")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
