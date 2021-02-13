//
//  MessageViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import Foundation

protocol MessageViewControllerProtocol {
    
    /**
     
     
     Method that receives messages from backend.
     
     */
    
    func getAllMessages()
    
    /**
     
     
     Method that sends a message to backend.
     
     */
    
//    func postNewMessage(person: Person,
//                        date: String,
//                        textMessage: String)
    
    // Dependecies
    var myView: MessageViewProtocol? {get set}
}
