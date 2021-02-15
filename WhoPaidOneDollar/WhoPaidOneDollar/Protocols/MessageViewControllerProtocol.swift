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
     
     
     Method that opens a view to send a new message with text field.
     
     */
    
    func newMessageButtonWasClicked()
    
    // Dependecies
    var myView: MessageViewProtocol? {get set}
}
