//
//  RequestSenderImplementationTests.swift
//  WhoPaidOneDollarTests
//
//  Created by Felipe Semissatto on 12/02/21.
//

import XCTest
@testable import WhoPaidOneDollar

class RequestSenderImplementationTests: XCTestCase {
    
    // MARK: - Test subject
    let testSubject = RequestSenderImplementation()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    // MARK: - Test cases
    
    func testPostPerson_WhenBackendIsUP_shouldReturnId() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "Person was properly posted.")
        
        let completionHandler: (String?, String?) -> Void = { idResponse, error in
            guard let id = idResponse else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            
            XCTAssertNotNil(id, "Error: id was not received.")
            
            responseExpectation.fulfill()
        }
        
        let mockPerson = Person(personId: 1,
                                name: "John",
                                photoUrl: URL(string: IMAGE_DEFAULT_URL),
                                twitter: "@twitter",
                                instagram: "@instagram",
                                date: NSDate.now as NSDate)
        
        // When
        let localDate = Date().get(.year) + "-" + Date().get(.month) + "-" + Date().get(.day)
        testSubject.addNewPerson(name: mockPerson.name,
                                 photoUrlString: mockPerson.photoUrl?.absoluteString,
                                 twitter: mockPerson.twitter,
                                 instagram: mockPerson.instagram,
                                 date: localDate,
                                 completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 5.0)
    }
    
    func testGetPeople_WhenBackendIsUp_shouldReturnPeople() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "People retrieved from backend and properly parsed.")
        
        let completionHandler: ([Person]?, String?) -> Void = { (people, error) in
            guard let peopleFromParser = people else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            XCTAssert(peopleFromParser.count > 0)
            
            responseExpectation.fulfill()
        }
        
        // When
        testSubject.getAllPeople(completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 10.0)
    }
    
    func testGetURLFromAImage_whenUserInsertProfilePic_shouldReturnURL() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "URL retrieved from IMGUR and properly parsed.")
        
        let completionHandler: (String?, String?) -> Void = { urlResponse, error in
            guard let url = urlResponse else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            
            XCTAssertNotNil(url, "Error: url was not received.")
            
            responseExpectation.fulfill()
        }
        
        // When
        testSubject.getURLFromAnImage(image: UIImage(),
                                      completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 5.0)
    }
    
    func testUpdatePerson_WhenBackendIsUp_shouldReturnNil() throws {
        // Given
        let responseExpectationPost = XCTestExpectation(description: "Person was properly posted.")
        
        let completionHandlerPost: (String?, String?) -> Void = { idResponse, error in
            guard let id = idResponse else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            
            XCTAssertNotNil(id, "Error: id was not received.")
            
            responseExpectationPost.fulfill()
        }
        
        let responseExpectationPut = XCTestExpectation(description: "Person was properly updated.")
        
        let completionHandlerPut: (String?) -> Void = {error in
            if let errorMessage = error  {
                XCTFail("Error ocurred with message \(errorMessage)")
                return
            }
                        
            responseExpectationPut.fulfill()
        }
        
        let mockPerson = Person(personId: 3,
                                name: "Robert",
                                photoUrl: URL(string: IMAGE_DEFAULT_URL),
                                twitter: "@lilrobert",
                                instagram: "@bigrob",
                                date: NSDate.now as NSDate)
        
        // When
        let localDate = Date().get(.year) + "-" + Date().get(.month) + "-" + Date().get(.day)
        testSubject.addNewPerson(name: mockPerson.name,
                                 photoUrlString: mockPerson.photoUrl?.absoluteString,
                                 twitter: mockPerson.twitter,
                                 instagram: mockPerson.instagram,
                                 date: localDate,
                                 completion: completionHandlerPost)
        
        let updatedPerson = Person(personId: 3,
                                name: "Robert",
                                photoUrl: URL(string: IMAGE_DEFAULT_URL),
                                twitter: "",
                                instagram: "",
                                date: NSDate.now as NSDate)
        
        testSubject.updatePerson(person: updatedPerson,
                                 completion: completionHandlerPut)
        
        // Then
        wait(for: [responseExpectationPost], timeout: 5.0)
        wait(for: [responseExpectationPut], timeout: 5.0)
    }
    
    // MARK: - Message Methods
    func testGetMessages_WhenBackendIsUp_shouldReturnMessages() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "Messages retrieved from backend and properly parsed.")
        
        let completionHandler: ([Message]?, String?) -> Void = { (messages, error) in
            guard let messagesFromParser = messages else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            XCTAssert(messagesFromParser.count > 0)
            
            responseExpectation.fulfill()
        }
        
        // When
        testSubject.getAllMessages(completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 10.0)
    }
    
    func testPostMessage_WhenBackendIsUP_shouldReturnNil() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "Message was properly posted.")
        
        let completionHandler: (String?) -> Void = {error in
            if let errorMessage = error  {
                XCTFail("Error ocurred with message \(errorMessage)")
                return
            }
                        
            responseExpectation.fulfill()
        }
        
        let mockPerson = Person(personId: 1,
                                name: "John",
                                photoUrl: URL(string: IMAGE_DEFAULT_URL),
                                twitter: "@twitter",
                                instagram: "@instagram",
                                date: NSDate.now as NSDate)
        let mockMessage = Message(messageId: 1,
                                  person: mockPerson,
                                  textMessage: "this message is a mock message",
                                  date: NSDate.now as NSDate)
        // When
        let localDate = Date().get(.year) + "-" + Date().get(.month) + "-" + Date().get(.day)
        testSubject.postNewMessage(person: mockMessage.person,
                                   date: localDate,
                                   textMessage: mockMessage.textMessage,
                                   completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 5.0)
    }
    
    // MARK: - Dollar Today Methods
    
    func testGetCurrenciesToday_WhenBackendIsUp_shouldReturnCurrencies() throws {
        // Given
        let responseExpectation = XCTestExpectation(description: "Currencies retrieved from Foreign Exchange Rates and properly parsed.")
        
        let completionHandler: ([Currency]?, String?) -> Void = { currencies, error in
            guard let currenciesFromParser = currencies else {
                XCTFail("Error ocurred with message \(error!)")
                return
            }
            
            XCTAssert(currenciesFromParser.count > 0)
            
            responseExpectation.fulfill()
        }
        
        // When
        testSubject.getAllCurrencies(completion: completionHandler)
        
        // Then
        wait(for: [responseExpectation], timeout: 5.0)
    }
}
