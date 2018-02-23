//
//  TestingUserDefaultsTests.swift
//  TestingUserDefaultsTests
//
//  Created by Krzysztof Profic on 23.02.2018.
//  Copyright © 2018 Krzysztof Profic. All rights reserved.
//

import XCTest
@testable import TestingUserDefaults

let object = "FIXTURE"

class TestingUserDefaultsTests: XCTestCase {
    var defaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        defaults = UserDefaults(suiteName: #file)
        defaults.removePersistentDomain(forName: #file)
    }
    
    // Uncommenting this test makes also testC to pass! 😡
    // But it doesn't do the trick if you rename it to testD! 🙃
//    func testA() {
//        XCTAssertFalse(defaults.bool(forKey: "whatever"))
//    }
    
    func testB() {
        // If we uncomment THIS assertion (in a totally different test)
        // It will make testC to pass! 😡
//        XCTAssertFalse(defaults.bool(forKey: "whatever"))

        defaults.set(object, forKey: #file)
        
        XCTAssertEqual(defaults.string(forKey: #file), object)
    }
    
    // >>> FAILING TEST <<<
    func testC() {
        // Cleaning up the defaults persistent damain doesnt work.
        // it doesn't work when performed as setUp for this test nor here. 😞
        defaults.removePersistentDomain(forName: #file)
        
        // even setting nil for theKey right before checking the value doesn't work. 😞
        defaults.set(nil, forKey: #file)
        
        XCTAssertNil(defaults.string(forKey: #file))
    }
}
