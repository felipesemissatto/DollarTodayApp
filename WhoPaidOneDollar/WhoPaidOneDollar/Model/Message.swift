//
//  Message.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 07/02/21.
//

import Foundation

class Message {
    private(set) var messageId: CLong
    private(set) var person: Person
    private(set) var textMessage: String
    private(set) var date: NSDate
    
    init(messageId: CLong,
         person: Person,
         textMessage: String,
         date: NSDate){
        self.messageId = messageId
        self.person = person
        self.textMessage = textMessage
        self.date = date
    }
}
