//
//  NewMessageViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 13/02/21.
//

import Foundation
import UIKit

class NewMessageViewControllerImplementation: UIViewController, NewMessageViewControllerProtocol {
    
    // MARK: - Dependencies
    var myView: NewMessageViewProtocol?
    let requestSender = RequestSenderImplementation()
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        let defaultView = NewMessageViewImplementation(viewController: self)
        self.myView = defaultView
        self.view = defaultView
        
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
        navigationItem.title = "Send a message"
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - NewMessageViewControllerProtocol methods
    func postNewMessage(person: Person, date: String, textMessage: String) {
        self.view = LoadingView(message: "Sending message...",
                                error: false,
                                frame: CGRect.zero)!
        
        requestSender.postNewMessage(person: person, date: date, textMessage: textMessage) { error in
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error Sending Message",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            self.view = self.mainView
            let alert = UIAlertController(title: "Success",
                                          message: "Message sent.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
