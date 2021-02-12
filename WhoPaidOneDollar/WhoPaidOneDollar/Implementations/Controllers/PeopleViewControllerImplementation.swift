//
//  PeopleViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 11/02/21.
//

import Foundation
import UIKit

class PeopleViewControllerImplementation: UIViewController, PeopleViewControllerProtocol {
    
    // MARK: - Dependencies
    var myView: PeopleViewProtocol?
    let requestSender = RequestSenderImplementation()
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        
        self.loadingView = LoadingView(message: "Loading the people...",
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
        navigationItem.title = "People"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllPeople()
    }
    
    // MARK: - LoginViewControllerProtocol methods
    func getAllPeople() {
        self.view = LoadingView(message: "Loading people...",
                                error: false,
                                frame: CGRect.zero)!
        
        requestSender.getAllPeople() { people, error in
            
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error Loading People",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let allPeople = people else {
                self.view = LoadingView(message: "Something went wrong",
                                       error: false,
                                       frame: CGRect.zero)!
                return
            }
            
            let person = Person(personId: 2,
                                name: "Testando",
                                photoUrl: URL(string: "https://i.imgur.com/E90UoQ0.jpg")!,
                                twitter: "teste",
                                instagram: "teste",
                                date: NSDate())
            let person1 = Person(personId: 2,
                                name: "Testando",
                                photoUrl: URL(string: "https://i.imgur.com/E90UoQ0.jpg")!,
                                twitter: "",
                                instagram: "teste",
                                date: NSDate())
            self.view = self.mainView
            let defaultView = PeopleViewImplementation(data: [person, person1], viewController: self)
            self.myView = defaultView
            self.view = defaultView
        }
    }
}
