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
    
    // Dependecies
    var myView: MessageViewProtocol? {get set}
}
