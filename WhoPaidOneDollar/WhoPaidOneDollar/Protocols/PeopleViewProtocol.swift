//
//  PeopleViewProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 11/02/21.
//

import Foundation

protocol PeopleViewProtocol {
    /**
     
     Method that starts the People view. It receives the view controller and the people who payed one dollar.
     
     - parameter data: people that will be shown.
     - parameter viewController: a controller with PeopleViewControllerProtocol type.
     
     */
    
    init(data: [Person], viewController: PeopleViewControllerProtocol)
    
    // Dependencies
    var viewController: PeopleViewControllerProtocol {get set}
}
