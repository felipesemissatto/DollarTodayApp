//
//  Person.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 07/02/21.
//

import Foundation

class Person {
    private(set) var personId: CLong
    private(set) var name: String
    private(set) var photoUrl: URL?
    private(set) var twitter: String?
    private(set) var instagram: String?
    private(set) var date: NSDate
    
    init (personId: CLong,
          name: String,
          photoUrl: URL?,
          twitter: String?,
          instagram: String?,
          date: NSDate) {
        self.personId = personId
        self.name = name
        self.photoUrl = photoUrl
        self.twitter = twitter
        self.instagram = instagram
        self.date = date
    }
}
