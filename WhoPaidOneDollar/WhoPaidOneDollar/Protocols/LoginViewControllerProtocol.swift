//
//  LoginViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import Foundation
import UIKit

protocol LoginViewControllerProtocol {
    
    /**
     
     
     Method that receives user photo to create an URL.
     
     */
    
    func insertNewPerson(image: UIImage,
                         name: String,
                         twitter: String?,
                         instagram: String?,
                         date: String)
    
    /**
     
     
     Method that receives user datas to create a new person in the backend database and store the datas in UserDefaults.
     
     - parameter name: name of the person
     - parameter photoUrlString: photo of the person by the URL string.
     - parameter twitter: user account from twitter
     - parameter instagram: user account from instagram
     - parameter date: current day.
     
     
     */
    
    func addNewPerson(name: String,
                      photoUrlString: String?,
                      twitter: String?,
                      instagram: String?,
                      date: String)
    
    // Dependecies
    var myView: LoginViewProtocol? {get set}
}
