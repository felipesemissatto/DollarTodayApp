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
    let requestSender = RequestSenderImplementation()
    
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
    
    func getURLFromImage(image: UIImage, person: Person) {
        if person.name != ""{
            self.view = LoadingView(message: "Updating...",
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
                let newPerson = Person(personId: person.personId,
                                       name: person.name,
                                       photoUrl: URL(string: urlProfilePic),
                                       twitter: person.twitter,
                                       instagram: person.instagram,
                                       date: person.date)
                
                
                self.updateProfile(person: newPerson)
            }
            
        } else {
            let alert = UIAlertController(title: "Empty name field",
                                          message: "The name field cannot be empty.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func updateProfile(person: Person) {
        requestSender.updatePerson(person: person) { error in
            
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error updating",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            } else {
                // Update person in UserDefaults
                UserDefaults.standard.set(person.name, forKey: "name")
                UserDefaults.standard.set(person.photoUrl, forKey: "photoUrlString")
                UserDefaults.standard.set(person.twitter, forKey: "twitter")
                UserDefaults.standard.set(person.instagram, forKey: "instagram")
                UserDefaults.standard.set(person.date, forKey: "date")
                
                // Reload data
                let defaultView = ProfileViewImplementation(viewController: self)
                self.myView = defaultView
                self.view = defaultView
            }
        }
    }
}
