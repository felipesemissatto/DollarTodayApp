//
//  ProfileViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 14/02/21.
//

import Foundation
import AuthenticationServices

class ProfileViewControllerImplementation: UIViewController, ProfileViewControllerProtocol {
    
    // MARK: - Dependencies
    var myView: ProfileViewProtocol?
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        let defaultView = ProfileViewImplementation(viewController: self)
        self.myView = defaultView
        self.view = defaultView
        
        self.loadingView = LoadingView(message: "Updating...",
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
    // MARK: - ProfileViewControllerProtocol methods
    func updateProfile(person: Person) {
        if person.name != ""{
            self.view = LoadingView(message: "Updating...",
                                   error: false,
                                   frame: CGRect.zero)!
            
        } else {
            let alert = UIAlertController(title: "Empty name field",
                                          message: "The name field cannot be empty.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
