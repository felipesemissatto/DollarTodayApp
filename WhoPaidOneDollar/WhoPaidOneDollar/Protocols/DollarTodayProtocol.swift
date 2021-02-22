//
//  DollarTodayProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation

protocol DollarTodayProtocol {
    /**
     
     Method that starts the currencies view. It receives the view controller and the currencies.
     
     - parameter data: currencies that will be shown.
     - parameter viewController: a controller with DollarTodayViewControllerProtocol type.
     
     */
    
    init(data: [Currency], viewController: DollarTodayViewControllerProtocol)
    
    // Dependencies
    var viewController: DollarTodayViewControllerProtocol {get set}
}
