//
//  ConverterMessageJSON.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import Foundation
import SwiftyJSON

//    MARK: - Error Handling
enum ErrorParseMessage: String, Error {
    case noMessageId = "Error: It was not possible to find the id field to create the message object. Check ConverterMessageJSON."
    case noTextMessage = "Error: It was not possible to find the text message field to create the object object. Check ConverterMessageJSON."
    case noDate = "Error: It was not possible to find the date field to create the message object. Check ConverterMessageJSON."
    case noPerson = "Error: It was not possible to find the id person field to create the message object. Check ConverterMessageJSON."
}


class ConverterMessageJSON: ConverterMessageJSONProtocol {
    
    // MARK: - ConverterMessageJSONProtocol methods
    func parserJSONMessages(json: [JSON]) -> [Message] {
        var messagesArray: [Message] = []
        
        for jsonEntry in json {
            do {
                messagesArray.append(try createMessage(json: jsonEntry))
            } catch is ErrorParseMessage {
                continue
            } catch {
                continue
            }
        }
        
        return messagesArray
    }
    
    func createMessage(json: JSON) throws -> Message {
        let personParser = ConverterPersonJSON()
        
        var id: CLong
        var textMessage: String
        var date: String
        var person: Person
        
        if let messageId = json["messageId"].number {
            id = CLong(truncating: messageId)
        } else {
            throw ErrorParseMessage.noMessageId
        }
        
        if let message = json["textMessage"].string {
            textMessage = message
        } else {
            throw ErrorParseMessage.noTextMessage
        }
        
        if let messageDateCreated = json["date"].string {
            date = messageDateCreated
        } else {
            throw ErrorParseMessage.noDate
        }
        
        if let personResponse = json["idPerson"].array {
            person = try personParser.createPerson(json: personResponse[0])
        } else {
            throw ErrorParseMessage.noPerson
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateCreated = dateFormatter.date(from: date)!
        
        let message = Message(messageId: id,
                              person: person,
                              textMessage: textMessage,
                              date: dateCreated as NSDate)
        
        return message
    }
}
