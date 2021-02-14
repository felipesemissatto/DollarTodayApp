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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Send A Message"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - NewMessageViewControllerProtocol methods
    func postNewMessage(person: Person, date: String, textMessage: String) {
        
    }
    
}
