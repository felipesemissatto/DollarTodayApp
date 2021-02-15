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
        
        if let personResponse = json["idPerson"].dictionary {
            var id: CLong
            var name: String
            var photoUrl: String?
            var twitter: String?
            var instagram: String?
            var date: String
            
            if let personId = personResponse["personId"]?.number {
                id = CLong(truncating: personId)
            } else {
                throw ErrorParsePerson.noPersonId
            }
            
            if let personName = personResponse["name"]?.string {
                name = personName
            } else {
                throw ErrorParsePerson.noName
            }
            
            if let personPhotoUrl = personResponse["photoUrl"]?.string {
                photoUrl = personPhotoUrl
            } else {
                throw ErrorParsePerson.noPhotoUrl
            }
            
            if let personTwitter = personResponse["twitter"]?.string {
                twitter = personTwitter
            } else {
                throw ErrorParsePerson.noTwitter
            }
            
            if let personInstagram = personResponse["instagram"]?.string {
                instagram = personInstagram
            } else {
                throw ErrorParsePerson.noInstagram
            }
            
            if let personDateCreated = personResponse["date"]?.string {
                date = personDateCreated
            } else {
                throw ErrorParsePerson.noDate
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateCreated = dateFormatter.date(from: date)!
            
            person = Person(personId: id,
                                name: name,
                                photoUrl: URL(string: photoUrl ?? IMAGE_DEFAULT_URL),
                                twitter: twitter,
                                instagram: instagram,
                                date: dateCreated as NSDate)
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
