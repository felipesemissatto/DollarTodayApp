//
//  ProfileViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 14/02/21.
//

import Foundation

protocol ProfileViewControllerProtocol {
    
    /**
     
     
     Method that updates the informations user by id in backend.
     
     */
    func updateProfile(person: Person)

    // Dependecies
    var myView: ProfileViewProtocol? {get set}
}
