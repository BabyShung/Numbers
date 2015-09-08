//
//  NumberListViewModelTests.swift
//  Numbers
//
//  Created by Hao Zheng on 9/7/15.
//  Copyright © 2015 Planhola.com. All rights reserved.
//

import XCTest
@testable import Numbers

class NumberListViewModelTests: XCTestCase {
    
    let vm = NumberListViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetNumbers() {
        getNumbersHelper(2)
        getNumbersHelper(10)
    }
    
    func getNumbersHelper(number : Int) {
        self.vm.reset()
        XCTAssertFalse(self.vm.queueIsEmpty(),"should not be empty")
        
        let loopTimes = 100 / number * 2
        
        for _ in 0 ..< loopTimes {
            self.vm.getNumbers(number)
        }
        XCTAssertTrue(self.vm.queueIsEmpty(),"should be empty")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
