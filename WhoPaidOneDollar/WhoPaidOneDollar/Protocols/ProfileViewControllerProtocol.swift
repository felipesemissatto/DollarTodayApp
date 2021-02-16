//
//  ProfileViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 14/02/21.
//

import Foundation
import UIKit

protocol ProfileViewControllerProtocol {
    
    /**
     
     
     Method that updates the informations user by id in backend.
     
     */
    func updateProfile(person: Person)

    /**
     
     
     Method that creates a URL from image by IMGUR API.
     
     */
    func getURLFromImage(image: UIImage, person: Person)
    
    // Dependecies
    var myView: ProfileViewProtocol? {get set}
}
