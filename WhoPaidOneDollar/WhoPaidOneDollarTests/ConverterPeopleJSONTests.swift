//
//  ConverterPeopleJSONTests.swift
//  WhoPaidOneDollarTests
//
//  Created by Felipe Semissatto on 12/02/21.
//

import SwiftyJSON
import XCTest
@testable import WhoPaidOneDollar

class ConverterPeopleJSONTests: XCTestCase {
    // MARK: - Setup and teardown methods
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
    
    // MARK: - Test subject
    let testSubject = ConverterPersonJSON()
    
    // MARK: - Test cases
    func testCreatePerson_whenGivenValidJSON_shouldGiveValidPerson() throws {
        
        // Given
        let inputJSON = createValidMockJSON()
        
        // When
        let resultPerson = try testSubject.createPerson(json: inputJSON)
        
        // Then
        let date = "2021-02-13"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateCreated = dateFormatter.date(from: date)!
        
        let expectedPerson = Person(personId: 1,
                                    name: "Peter",
                                    photoUrl: URL(string: IMAGE_DEFAULT_URL),
                                    twitter: "@peter",
                                    instagram: "@peter.pete",
                                    date: dateCreated as NSDate)
        
        XCTAssertEqual(resultPerson.personId, expectedPerson.personId)
        XCTAssertEqual(resultPerson.name, expectedPerson.name)
        XCTAssertEqual(resultPerson.photoUrl, expectedPerson.photoUrl)
        XCTAssertEqual(resultPerson.twitter, expectedPerson.twitter)
        XCTAssertEqual(resultPerson.instagram, expectedPerson.instagram)
        XCTAssertEqual(resultPerson.date, expectedPerson.date)
    }
    
    func testCreatePerson_whenGivenInvalidJSON_shouldGiveError() throws {
        
        // Given
        let inputJSON = createInvalidMockJSON()
        
        do {
            // When
            _ = try testSubject.createPerson(json: inputJSON)

            XCTFail("The id field is not a string field, but an integer. An error was expected.")
        }
        catch {
            // Then
            XCTAssert(true)
        }
    }
    
    // MARK: - Methods
    func createValidMockJSON() -> JSON {

        let json: JSON = JSON([
            "personId" : 1,
            "name" : "Peter",
            "photoUrl" : IMAGE_DEFAULT_URL,
            "twitter" : "@peter",
            "instagram" : "@peter.pete",
            "date" : "2021-02-13",
        ])

        return json
    }

    func createInvalidMockJSON() -> JSON {

        let json: JSON = JSON([
            "personId" : "1",
            "name" : "Peter",
            "photoUrl" : IMAGE_DEFAULT_URL,
            "twitter" : "@peter",
            "instagram" : "@peter.pete",
            "date" : "2021-02-13",
        ])

        return json
    }
}
