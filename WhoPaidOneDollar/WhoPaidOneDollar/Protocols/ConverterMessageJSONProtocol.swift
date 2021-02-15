//
//  ConverterMessageJSONProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import Foundation
import SwiftyJSON

protocol ConverterMessageJSONProtocol {
    /**
    Method that converts a JSON in a list of message.

    - parameter json: JSON object which contains a list of messages.

    */
    func parserJSONMessages(json: [JSON]) -> [Message]
    
    /**
    Method that converts a JSON in a message.

    - parameter json: JSON object which contains a message.

    */
    func createMessage(json: JSON) throws -> Message
}
