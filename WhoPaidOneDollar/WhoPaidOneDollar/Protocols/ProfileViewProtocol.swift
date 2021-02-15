//
//  ProfileViewProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 14/02/21.
//

import Foundation

import Foundation

protocol ProfileViewProtocol {
    /**
     
     Method that starts the Profile view. It receives the view controller.
     
     - parameter viewController: a controller with PeopleViewControllerProtocol type.
     
     */
    
    init(viewController: ProfileViewControllerProtocol)
    
    // Dependencies
    var viewController: ProfileViewControllerProtocol {get set}
}
