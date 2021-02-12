//
//  PeopleViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 11/02/21.
//

import Foundation
import UIKit

protocol PeopleViewControllerProtocol {
    
    /**
     
     
     Method that receives people from backend.
     
     */
    
    func getAllPeople()
    
    
    // Dependecies
    var myView: PeopleViewProtocol? {get set}
}
