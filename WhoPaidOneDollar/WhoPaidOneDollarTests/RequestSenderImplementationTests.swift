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
    
}
