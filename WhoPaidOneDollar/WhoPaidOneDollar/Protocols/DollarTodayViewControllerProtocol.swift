//
//  DollarTodayViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation

protocol DollarTodayViewControllerProtocol {
    
    /**
     
     
     Method that receives currencies from exchange rate API.
     
     */
    
    func getAllCurrencies()
    
    
    // Dependecies
    var myView: DollarTodayProtocol? {get set}
}
