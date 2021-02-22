//
//  DollarTodayViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import UIKit

class DollarTodayViewControllerImplementation: UIViewController, DollarTodayViewControllerProtocol{
    
    
    // MARK: - Dependencies
    var myView: DollarTodayViewProtocol?
    let requestSender = RequestSenderImplementation()
    
    // MARK: - Private Variables
    private var loadingView = UIView()
    private var mainView = UIView()
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        
        self.loadingView = LoadingView(message: "Loading currencies...",
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
        navigationItem.title = "Dollar Today"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllCurrencies()
    }
    
    // MARK: - DollarTodayViewControllerProtocol methods
    func getAllCurrencies() {
        self.view = LoadingView(message: "Loading currencies...",
                                error: false,
                                frame: CGRect.zero)!
        
        requestSender.getAllCurrencies() { currencies, error in
            
            if error != nil {
                self.view = self.mainView
                
                let alert = UIAlertController(title: "Error Loading Currencies",
                                              message: "Connection fail. Try it again later.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            guard let allCurrencies = currencies else {
                self.view = LoadingView(message: "Something went wrong",
                                       error: true,
                                       frame: CGRect.zero)!
                return
            }
            
            self.view = self.mainView
            let defaultView = DollarTodayViewImplementation(data: allCurrencies, viewController: self)
            self.myView = defaultView
            self.view = defaultView
        }
        
    }
}
