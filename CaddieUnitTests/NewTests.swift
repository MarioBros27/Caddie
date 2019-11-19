//
//  NewTests.swift
//  CaddieUnitTests
//
//  Created by Andres on 11/15/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import XCTest

class NewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func addAlbatrosSuccess(){
        let playerdao = PlayerDAO()
        var players : [Player] = playerdao.getAllPlayersOrderedById()
        let currentAlbatros = players[0].albatros
        
        playerdao.addPointAlbatros(id: 1)
        players = playerdao.getAllPlayersOrderedById()
        let newAlbatros = players[0].albatros
        
        
        
    }

}
