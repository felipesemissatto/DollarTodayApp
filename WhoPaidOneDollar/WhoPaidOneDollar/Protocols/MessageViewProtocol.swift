//
//  MessageViewProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import Foundation

protocol MessageViewProtocol {
    /**
     
     Method that starts the Message view. It receives the view controller and the messages.
     
     - parameter data: messages that will be shown.
     - parameter viewController: a controller with PeopleViewControllerProtocol type.
     
     */
    
    init(data: [Message], viewController: MessageViewControllerProtocol)
    
    // Dependencies
    var viewController: MessageViewControllerProtocol {get set}
}
