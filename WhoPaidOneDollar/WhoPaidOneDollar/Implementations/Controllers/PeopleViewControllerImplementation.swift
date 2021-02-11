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
    
    // MARK: - Lifecycle methods
    override func loadView() {
//        super.loadView()
//        let defaultView = PeopleViewImplementation(viewController: self)
//        self.myView = defaultView
//        self.view = defaultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - LoginViewControllerProtocol methods
    func getAllPeople() {
        
    }
}
