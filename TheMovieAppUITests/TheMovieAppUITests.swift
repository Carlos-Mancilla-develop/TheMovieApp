//
//  TheMovieAppUITests.swift
//  TheMovieAppUITests
//
//  Created by Carlos Mancilla on 25-11-20.
//

import XCTest

class TheMovieAppUITests: XCTestCase {

    func testMovieNavigation() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Unfortunate Stories"]/*[[".cells.staticTexts[\"Unfortunate Stories\"]",".staticTexts[\"Unfortunate Stories\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Welcome to Sudden Death"]/*[[".cells.staticTexts[\"Welcome to Sudden Death\"]",".staticTexts[\"Welcome to Sudden Death\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["The SpongeBob Movie: Sponge on the Run"]/*[[".cells.staticTexts[\"The SpongeBob Movie: Sponge on the Run\"]",".staticTexts[\"The SpongeBob Movie: Sponge on the Run\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["TheMovieApp.DetailView"].buttons["Back"].tap()
        
        
    }
}
