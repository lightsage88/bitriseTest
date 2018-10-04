//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Adrian Rosales on 10/4/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye


class BullsEyeTests: XCTestCase {
    var gameUnderTest: BullsEyeGame!

    override func setUp() {
        gameUnderTest = BullsEyeGame()
        gameUnderTest.startNewGame()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        gameUnderTest = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // 1. given
        let guess = gameUnderTest.targetValue - 5
        
        // 2. when
        _ = gameUnderTest.check(guess: guess)
        
        // 3. then
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        func testScoreIsComputedWhenGuessGTTarget() {
//            // 1. given
//            let guess = gameUnderTest.targetValue + 5
//
//            // 2. when
//            _ = gameUnderTest.check(guess: guess)
//
//            // 3. then
//            XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
        }
    

    

}
