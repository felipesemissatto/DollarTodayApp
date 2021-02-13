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
        navigationItem.title = "People"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllMessages()
    }
    
    // MARK: - MessageViewControllerProtocol methods
    func getAllMessages() {
        
    }
}
