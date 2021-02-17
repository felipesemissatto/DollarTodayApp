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
        self.mainView = self.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAllMessages()
    }
    
    // MARK: -IBAction functions
    
    @IBAction func tapAddButton(_ sender: Any) {
        newMessageButtonWasClicked()
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
        if let navController = self.navigationController {
            let viewController = NewMessageViewControllerImplementation()
            navController.pushViewController(viewController, animated: true)
        }
    }
}
