//
//  ConverterPersonJSONProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import Foundation
import SwiftyJSON

protocol ConverterPersonJSONProtocol {
    /**
    Method that converts a JSON in a list of people.

    - parameter json: JSON object which contains a list of people.

    */
    func parserJSONPeople(json: [JSON]) -> [Person]
    
    /**
    Method that converts a JSON in a person.

    - parameter json: JSON object which contains a person.

    */
    func createPerson(json: JSON) throws -> Person
}
