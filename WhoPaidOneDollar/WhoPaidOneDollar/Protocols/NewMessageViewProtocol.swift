//
//  NewMessageViewProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import Foundation

protocol NewMessageViewProtocol {
    /**
     
     Method that starts the New Message view. It receives the view controller.
     
     - parameter viewController: a controller with ProfileViewControllerProtocol type.
     
     */
    
    init(viewController: NewMessageViewControllerProtocol)
    
    // Dependencies
    var viewController: NewMessageViewControllerProtocol {get set}
}
