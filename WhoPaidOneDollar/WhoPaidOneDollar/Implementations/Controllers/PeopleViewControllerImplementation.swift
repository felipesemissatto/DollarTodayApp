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
        
        self.loadingView = LoadingView(message: "Loading members...",
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
        navigationItem.title = "Members"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllPeople()
    }
    
    // MARK: - PeopleViewControllerProtocol methods
    func getAllPeople() {
        self.view = LoadingView(message: "Loading members...",
                                error: false,
                                frame: CGRect.zero)!
        
        requestSender.getAllPeople() { people, error in
            
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error Loading members",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let allPeople = people else {
                self.view = LoadingView(message: "Something went wrong",
                                       error: true,
                                       frame: CGRect.zero)!
                return
            }
            
            self.view = self.mainView
            let defaultView = PeopleViewImplementation(data: allPeople, viewController: self)
            self.myView = defaultView
            self.view = defaultView
        }
    }
}
