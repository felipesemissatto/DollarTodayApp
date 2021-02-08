//
//  LoginViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import Foundation
import AuthenticationServices

class LoginViewControllerImplementation: UIViewController, LoginViewControllerProtocol {
    
    // MARK: - Dependencies
    var myView: LoginViewProtocol?
    let requestSender = RequestSenderImplementation()
    
    
    
    // MARK: - LoginViewControllerProtocol methods
    func addNewPerson(name: String, photoUrl: URL?, twitter: String?, instagram: String?, date: NSDate) {
        requestSender.addNewPerson(name: name,
                                   photoUrl: photoUrl,
                                   twitter: twitter,
                                   instagram: instagram,
                                   date: date) { error in
            
            if error != nil {
                let alert = UIAlertController(title: "Error registering",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            // Save person in UserDefaults
            
            // Push controller and the user enters in the app
            
        }
    }
}
