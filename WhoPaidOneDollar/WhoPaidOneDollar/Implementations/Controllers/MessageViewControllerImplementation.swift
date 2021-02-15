//
//  MessageViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import Foundation
import UIKit

class MessageViewControllerImplementation: UIViewController, MessageViewControllerProtocol {
    
    // MARK: - Dependencies
    var myView: MessageViewProtocol?
    let requestSender = RequestSenderImplementation()
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        
        self.loadingView = LoadingView(message: "Loading messages...",
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllMessages()
    }
    
    // MARK: - MessageViewControllerProtocol methods
    func getAllMessages() {
        self.view = LoadingView(message: "Loading messages...",
                                error: false,
                                frame: CGRect.zero)!
        
        requestSender.getAllMessages() { messages, error in
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error Loading Messages",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let allMessages = messages else {
                self.view = LoadingView(message: "Something went wrong",
                                       error: true,
                                       frame: CGRect.zero)!
                return
            }
            
            self.view = self.mainView
            let defaultView = MessageViewImplementation(data: allMessages, viewController: self)
            self.myView = defaultView
            self.view = defaultView
        }
    }
    
    func newMessageButtonWasClicked(){
        performSegue(withIdentifier: "SendMessageSegue", sender: nil)
    }
}
