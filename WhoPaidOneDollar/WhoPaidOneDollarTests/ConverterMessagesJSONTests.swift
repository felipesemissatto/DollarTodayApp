//
//  ConverterMessagesJSONTests.swift
//  WhoPaidOneDollarTests
//
//  Created by Felipe Semissatto on 13/02/21.
//

import SwiftyJSON
import XCTest
@testable import WhoPaidOneDollar

class ConverterMessagesJSONTests: XCTestCase {
    // MARK: - Setup and teardown methods
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
    
    // MARK: - Test subject
    let testSubject = ConverterMessageJSON()
    
    // MARK: - Test cases
    func testCreateMessage_whenGivenValidJSON_shouldGiveValidMessage() throws {
        
        // Given
        let inputJSON = createValidMockJSON()
        
        // When
        let resultMessage = try testSubject.createMessage(json: inputJSON)
        
        // Then
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var date = "2021-02-12"
        var dateCreated = dateFormatter.date(from: date)!
        let expectedPerson = Person(personId: 45,
                                    name: "Felipe no iphone",
                                    photoUrl: URL(string: "https://i.imgur.com/dsGJM5Y.jpg"),
                                    twitter: "mushu",
                                    instagram: "mushuzao",
                                    date: dateCreated as NSDate)
        
        date = "2027-03-03"
        dateCreated = dateFormatter.date(from: date)!
        let expectedMessage = Message(messageId: 3,
                                      person: expectedPerson,
                                      textMessage: "o pai tá on!!!!!!!",
                                      date: dateCreated as NSDate)
        
        XCTAssertEqual(resultMessage.messageId, expectedMessage.messageId)
        XCTAssertEqual(resultMessage.textMessage, expectedMessage.textMessage)
        XCTAssertEqual(resultMessage.date, expectedMessage.date)
        
        XCTAssertEqual(resultMessage.person.personId, expectedPerson.personId)
        XCTAssertEqual(resultMessage.person.name, expectedPerson.name)
        XCTAssertEqual(resultMessage.person.photoUrl, expectedPerson.photoUrl)
        XCTAssertEqual(resultMessage.person.twitter, expectedPerson.twitter)
        XCTAssertEqual(resultMessage.person.instagram, expectedPerson.instagram)
        XCTAssertEqual(resultMessage.person.date, expectedPerson.date)
    }
    
    func testCreateMessage_whenGivenInvalidJSON_shouldGiveError() throws {
        
        // Given
        let inputJSON = createInvalidMockJSON()
        
        do {
            // When
            _ = try testSubject.createMessage(json: inputJSON)

            XCTFail("The photoUrl field was not found. An error was expected.")
        }
        catch {
            // Then
            XCTAssert(true)
        }
    }
    
    // MARK: - Methods
    func createValidMockJSON() -> JSON {

        let json: JSON = JSON([
            "messageId":3,
            "textMessage":"o pai tá on!!!!!!!",
            "date":"2027-03-03",
            "idPerson":[
                "personId":45,
                "name":"Felipe no iphone",
                "photoUrl":"https://i.imgur.com/dsGJM5Y.jpg",
                "twitter":"mushu",
                "instagram":"mushuzao",
                "date":"2021-02-12"
            ],
        ])

        return json
    }

    func createInvalidMockJSON() -> JSON {

        let json: JSON = JSON([
            "messageId":3,
            "textMessage":"o pai tá on!!!!!!!",
            "date":"2027-03-03",
            "idPerson":[
                "personId":45,
                "name":"Felipe no iphone",
                "twitter":"mushu",
                "instagram":"mushuzao",
                "date":"2021-02-12"
            ],
        ])

        return json
    }
}
