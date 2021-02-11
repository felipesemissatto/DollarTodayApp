//
//  LoginViewProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import Foundation

protocol LoginViewProtocol {
    /**
     
     Method that starts the login view. It receives the view controller.
     
     - parameter viewController: a controller with PeopleViewControllerProtocol type.
     
     */
    
    init(viewController: PeopleViewControllerProtocol)
    
    // Dependencies
    var viewController: PeopleViewControllerProtocol {get set}
}
