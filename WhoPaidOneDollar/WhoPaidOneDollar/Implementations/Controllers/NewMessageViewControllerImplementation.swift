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
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        let defaultView = NewMessageViewImplementation(viewController: self)
        self.myView = defaultView
        self.view = defaultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - NewMessageViewControllerProtocol methods
    func postNewMessage(person: Person, date: String, textMessage: String) {
        
    }
    
}
