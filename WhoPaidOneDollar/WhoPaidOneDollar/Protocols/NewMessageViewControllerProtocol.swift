//
//  NewMessageViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import Foundation

protocol NewMessageViewControllerProtocol {
    
    /**
     
     
     Method that sends a new message to backend.
     
     */
    func postNewMessage(person: Person,
                        date: String,
                        textMessage: String)

    // Dependecies
    var myView: NewMessageViewProtocol? {get set}
}
