//
//  CaddieUITests.swift
//  CaddieUITests
//
//  Created by Andres on 11/24/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import XCTest

class CaddieUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    
    func testPlayGame(){
        let app = XCUIApplication()
        
        app.buttons["Jugar"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["NewPar4"]/*[[".cells.staticTexts[\"NewPar4\"]",".staticTexts[\"NewPar4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2vs2"]/*[[".cells.staticTexts[\"2vs2\"]",".staticTexts[\"2vs2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
      
        app.textFields["Jugador 1"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Mario")
        let marioPickerWheel = app.pickerWheels["Mario"]
        marioPickerWheel.tap()
        app.navigationBars["Equipo 1"].buttons["Siguiente"].tap()
//
//        app.pickerWheels.element.adjust(toPickerWheelValue: "Mario")
//        let marioPickerWheel = app.pickerWheels["Mario"]
//        marioPickerWheel.tap()
//        jugador1TextField.tap()
//        marioPickerWheel.tap()
//        app.navigationBars["Equipo 2"].buttons["Comenzar"].tap()
        
        
        
        
    }

}
