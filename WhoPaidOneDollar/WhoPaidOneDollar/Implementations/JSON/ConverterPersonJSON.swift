//
//  ConverterPersonJSON.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import Foundation
import SwiftyJSON

//    MARK: - Error Handling
enum ErrorParsePerson: String, Error {
    case noPersonId = "Error: It was not possible to find the id field to create the person object. Check ConverterPersonJSON."
    case noName = "Error: It was not possible to find the name field to create the person object. Check ConverterPersonJSON."
    case noPhotoUrl = "Error: It was not possible to find the photo url field to create the person object. Check ConverterPersonJSON."
    case noTwitter = "Error: It was not possible to find the twitter field to create the person object. Check ConverterPersonJSON."
    case noInstagram = "Error: It was not possible to find the instagram field to create the person object. Check ConverterPersonJSON."
    case noDate = "Error: It was not possible to find the date field to create the person object. Check ConverterPersonJSON."
}


class ConverterPersonJSON: ConverterPersonJSONProtocol {
    
    // MARK: - ConverterPersonJSONProtocol methods
    func createPerson(json: JSON) throws -> Person {
        var id: CLong
        var name: String
        var photoUrl: String?
        var twitter: String?
        var instagram: String?
        var date: String
        
        if let personId = json["personId"].number {
            id = CLong(truncating: personId)
        } else {
            throw ErrorParsePerson.noPersonId
        }
        
        if let personName = json["name"].string {
            name = personName
        } else {
            throw ErrorParsePerson.noName
        }
        
        if let personPhotoUrl = json["photoUrl"].string {
            photoUrl = personPhotoUrl
        } else {
            throw ErrorParsePerson.noPhotoUrl
        }
        
        if let personTwitter = json["twitter"].string {
            twitter = personTwitter
        } else {
            throw ErrorParsePerson.noTwitter
        }
        
        if let personInstagram = json["instagram"].string {
            instagram = personInstagram
        } else {
            throw ErrorParsePerson.noInstagram
        }
        
        if let personDateCreated = json["date"].string {
            date = personDateCreated
        } else {
            throw ErrorParsePerson.noInstagram
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateCreated = dateFormatter.date(from: date)!
        
        let person = Person(personId: id,
                            name: name,
                            photoUrl: URL(string: photoUrl ?? IMAGE_DEFAULT_URL),
                            twitter: twitter,
                            instagram: instagram,
                            date: dateCreated as NSDate)
        
        return person
    }
    
    func parserJSONPeople(json: [JSON]) -> [Person] {
        var peopleArray: [Person] = []
        
        for jsonEntry in json {
            do {
                peopleArray.append(try createPerson(json: jsonEntry))
            } catch is ErrorParsePerson {
                continue
            } catch {
                continue
            }
        }
        
        return peopleArray
    }
}
