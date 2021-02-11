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
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        let defaultView = LoginViewImplementation(viewController: self)
        self.myView = defaultView
        self.view = defaultView
        
        self.loadingView = LoadingView(message: "Saving...",
                                       error: false,
                                       frame: CGRect.zero)!
        self.view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        self.view.sendSubviewToBack(self.loadingView)
        
        self.mainView = self.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - LoginViewControllerProtocol methods
    
    func insertNewPerson(image: UIImage,
                         name: String,
                         twitter: String?,
                         instagram: String?,
                         date: String) {
        if name != ""{
            self.view = LoadingView(message: "Saving...",
                                   error: false,
                                   frame: CGRect.zero)!
            
            requestSender.getURLFromAnImage(image: image) { url, error   in
                
                if error != nil {
                    self.view = self.mainView
                    
                    let alert = UIAlertController(title: "Error Uploading Image",
                                                  message: "Connection fail. Try it again later.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
                
                guard let urlProfilePic = url else {
                    return
                }
                
                self.addNewPerson(name: name,
                                  photoUrlString: urlProfilePic,
                                  twitter: twitter,
                                  instagram: instagram,
                                  date: date)
            }
        } else {
            let alert = UIAlertController(title: "Empty fields",
                                          message: "Please, insert at least a name.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func addNewPerson(name: String, photoUrlString: String?, twitter: String?, instagram: String?, date: String) {
        requestSender.addNewPerson(name: name,
                                   photoUrlString: photoUrlString,
                                   twitter: twitter,
                                   instagram: instagram,
                                   date: date) { idResponse, error in
            
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error registering",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            // Save person in UserDefaults
            UserDefaults.standard.set(idResponse, forKey: "id")
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(photoUrlString, forKey: "photoUrlString")
            UserDefaults.standard.set(twitter, forKey: "twitter")
            UserDefaults.standard.set(instagram, forKey: "instagram")
            UserDefaults.standard.set(date, forKey: "date")
            
            // Push controller and the user enters in the app
            if let navController = self.navigationController {
//                let schoolViewController = SchoolViewControllerImplementation(data: school)
//                navController.pushViewController(schoolViewController, animated: true)
            }
        }
    }
}
