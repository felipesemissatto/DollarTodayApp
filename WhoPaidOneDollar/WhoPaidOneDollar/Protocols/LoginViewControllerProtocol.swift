//
//  LoginViewControllerProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import Foundation

protocol LoginViewControllerProtocol {
    
    /**
     
     
     Method that receives user datas to create a new person in the backend database and store the datas in UserDefaults.
     
     - parameter name: name of the person
     - parameter photoUrl: photo of the person
     - parameter twitter: user account from twitter
     - parameter instagram: user account from instagram
     
     
     */
    
    func addNewPerson(name: String,
                      photoUrl: URL?,
                      twitter: String?,
                      instagram: String?,
                      date: NSDate)
    
    // Dependecies
    var myView: LoginViewProtocol? {get set}
}
