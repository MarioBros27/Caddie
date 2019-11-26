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


    func testSeeStatistics(){
        let app = XCUIApplication()
      app.buttons["Jugadores"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Ivan"].tap()
        XCTAssert(app.staticTexts["Handycap"].exists)
        XCTAssert(app.staticTexts["Albatros"].exists)
        XCTAssert(app.staticTexts["Birdies"].exists)
        XCTAssert(app.staticTexts["Chip ins"].exists)
        XCTAssert(app.staticTexts["Eagles"].exists)
        XCTAssert(app.staticTexts["Hoy es"].exists)
        XCTAssert(app.staticTexts["Sandy pars"].exists)

        app.navigationBars["Caddie.PlayerStatisticsView"].buttons["Lista de jugadores"].tap()
        app.navigationBars["Lista de jugadores"].buttons["Caddie"].tap()
        
        
    }
    func testPlayGame(){
        let app = XCUIApplication()
        
        app.buttons["Jugar"].tap()
        
        let tablesQuery = app.tables
        
        app.switches.firstMatch.tap()
        
        tablesQuery.staticTexts["Demo Course"].tap()
        
        
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2vs2"]/*[[".cells.staticTexts[\"2vs2\"]",".staticTexts[\"2vs2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
      
        app.textFields["Jugador 1"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Ivan")
        let marioPickerWheel = app.pickerWheels["Ivan"]
        marioPickerWheel.tap()
        
        app.textFields["Jugador 2"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Enrique")
        let enriquePickerWheel = app.pickerWheels["Enrique"]
        enriquePickerWheel.tap()
        app.navigationBars["Equipo 1"].buttons["Siguiente"].tap()
        
        app.textFields["Jugador 1"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Daniel")
        let danielPickerWheel = app.pickerWheels["Daniel"]
        danielPickerWheel.tap()
        
        app.textFields["Jugador 2"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "Oscar")
        let oscarPickerWheel = app.pickerWheels["Oscar"]
        oscarPickerWheel.tap()
        app.navigationBars["Equipo 2"].buttons["Comenzar"].tap()

        //MARK: Hole 1
        
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        
        let incrementButtonEnrique = tablesQuery.cells.containing(.staticText, identifier:"Enrique").buttons["Increment"]
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()

        
        let incrementButtonDaniel = tablesQuery.cells.containing(.staticText, identifier:"Daniel").buttons["Increment"]
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        
        app.swipeUp()
        let incrementButtonOscar = tablesQuery.cells.containing(.staticText, identifier:"Oscar").buttons["Increment"]
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        
        app.swipeDown()
        
        app.navigationBars["1"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        
        let cellsQuery = XCUIApplication().tables.cells
        
        
        XCTAssert(cellsQuery.children(matching: .staticText).matching(identifier: "2").element(boundBy: 0).exists)
        XCTAssert(cellsQuery.children(matching: .staticText).matching(identifier: "2").element(boundBy: 1).exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["2"].tap()
        
        
        //MARK: Hole 2
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Enrique").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()

        incrementButtonDaniel.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 1).tap()
        app.swipeUp()

        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        
        
        app.swipeDown()
        
        app.navigationBars["2"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        
        XCTAssert(tablesQuery.staticTexts["6"].exists)
        XCTAssert(tablesQuery.staticTexts["3"].exists)
        
        XCUIApplication().navigationBars["Puntajes"].buttons["3"].tap()

        //MARK: Hole 3
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Enrique").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        incrementButtonDaniel.tap()
        
        incrementButtonDaniel.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        app.swipeUp()

        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        app.swipeDown()
        
        app.navigationBars["3"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        
        
        
        XCTAssert(tablesQuery.staticTexts["8"].exists)
        XCTAssert(tablesQuery.staticTexts["7"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["4"].tap()
        
        
        //MARK: Hole 4
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        
        
        incrementButtonDaniel.tap()
        
        incrementButtonDaniel.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 1).tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        
        app.swipeUp()

        incrementButtonOscar.tap()

        app.swipeDown()
        
        app.navigationBars["4"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        XCTAssert(tablesQuery.staticTexts["10"].exists)
        XCTAssert(tablesQuery.staticTexts["10"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["5"].tap()
        
        //MARK: Hole 5
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        
        
        
        
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()

        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        app.swipeUp()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
tablesQuery.cells.containing(.staticText, identifier:"Oscar").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 1).tap()
        
        app.swipeDown()
        
        app.navigationBars["5"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        
        XCTAssert(tablesQuery.staticTexts["14"].exists)
        XCTAssert(tablesQuery.staticTexts["13"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["6"].tap()
        
        //MARK: Hole 6
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 1).tap()
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        app.swipeUp()

        
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()

        tablesQuery.cells.containing(.staticText, identifier:"Oscar").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 1).tap()
        tablesQuery.cells.containing(.staticText, identifier:"Oscar").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        app.swipeDown()
        
        app.navigationBars["6"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        
        XCTAssert(tablesQuery.staticTexts["18"].exists)
        XCTAssert(tablesQuery.staticTexts["15"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["7"].tap()
        
        
        //MARK: Hole 7
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Enrique").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        
        
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        
        app.swipeUp()

        incrementButtonOscar.tap()
tablesQuery.cells.containing(.staticText, identifier:"Oscar").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        
        app.swipeDown()
        
        app.navigationBars["7"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        XCTAssert(tablesQuery.staticTexts["20"].exists)
        XCTAssert(tablesQuery.staticTexts["20"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["8"].tap()
        
        
        
        
        
        
        //MARK: Hole 8
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        
        
        incrementButtonDaniel.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Daniel").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        app.swipeUp()
        incrementButtonOscar.tap()
        incrementButtonOscar.tap()

        
        app.swipeDown()
        
        app.navigationBars["8"].buttons["Siguiente"].tap()
        app.tables.buttons["Resultados"].tap()
        XCTAssert(tablesQuery.staticTexts["20"].exists)
        XCTAssert(tablesQuery.staticTexts["23"].exists)
        XCUIApplication().navigationBars["Puntajes"].buttons["9"].tap()
        
        
        
        //MARK: Hole 9
        tablesQuery.cells.containing(.staticText, identifier:"Ivan").buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Ivan")/*[[".cells.containing(.staticText, identifier:\"2\")",".cells.containing(.staticText, identifier:\"Ivan\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Increment"].tap()
        
        incrementButtonEnrique.tap()
        incrementButtonEnrique.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Enrique").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 0).tap()
        
        
        incrementButtonDaniel.tap()
        incrementButtonDaniel.tap()
        app.swipeUp()

        incrementButtonOscar.tap()
        incrementButtonOscar.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Oscar").children(matching: .button).matching(identifier: "unchekedPhoto").element(boundBy: 2).tap()
        
      
        app.navigationBars["9"].buttons["Terminar"].tap()
        
        XCTAssert(tablesQuery.staticTexts["24"].exists)
        XCTAssert(tablesQuery.staticTexts["31"].exists)
        
        app.navigationBars["Caddie.FinalScoreTableView"].buttons["OK"].tap()
        
        
        

    }

}
