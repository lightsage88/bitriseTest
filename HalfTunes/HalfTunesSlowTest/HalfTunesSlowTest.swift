//
//  HalfTunesSlowTest.swift
//  HalfTunesSlowTest
//
//  Created by Adrian Rosales on 10/4/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes

class HalfTunesSlowTest: XCTestCase {
    var sessionUnderTest: URLSession!
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        func testValidCallToiTunesGetsHTTPStatusCode200() {
            // given
            let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
            // 1
            let promise = expectation(description: "Status code: 200")
            
            // when
            let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
                // then
                if let error = error {
                    XCTFail("Error: \(error.localizedDescription)")
                    return
                } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if statusCode == 200 {
                        // 2
                        promise.fulfill()
                    } else {
                        XCTFail("Status code: \(statusCode)")
                    }
                }
            }
            dataTask.resume()
            // 3
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertNil(responseError)
            XCTAssertEqual(statusCode, 200)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
