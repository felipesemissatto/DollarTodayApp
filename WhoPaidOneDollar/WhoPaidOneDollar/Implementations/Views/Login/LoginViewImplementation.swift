//
//  LoginViewImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import UIKit
import AuthenticationServices

class LoginViewImplementation: UIView, LoginViewProtocol {
    
    // MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var viewController: LoginViewControllerProtocol
    
    // MARK: - Init methods
    required init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("LoginViewImplementation", owner: self, options: nil),
           let nibView = nib.first as? UIView {
            nibView.frame = bounds
            nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(nibView)
        }
    }
    
    // MARK: - Private methods
    
    /**
     
     Method that configs the table view.
     
     */
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /**
     
     Method that links the XIB with a cell by the identifier.
     
     - parameters nibName: the name of cell identifier.
     
     */
    
    private func referenceXib(nibName: String) {
        let nib = UINib.init(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
}

// MARK: - Extension Table View Data Source Methods
extension LoginViewImplementation: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = String()
        var finalCell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cellIdentifier = "PhotoTableViewCell"
            referenceXib(nibName: cellIdentifier)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PhotoTableViewCell  else {
                fatalError("The dequeued cell is not an instance of PhotoTableViewCell.")
            }
            
            finalCell = cell
        case 1:
            cellIdentifier = "TextFieldsTableViewCell"
            referenceXib(nibName: cellIdentifier)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TextFieldsTableViewCell  else {
                fatalError("The dequeued cell is not an instance of TextFieldsTableViewCell.")
            }
            
            finalCell = cell
        case 2:
            cellIdentifier = "ButtonSaveTableViewCell"
            referenceXib(nibName: cellIdentifier)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ButtonSaveTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ButtonSaveTableViewCell.")
            }
            
            finalCell = cell
            
        default:
            finalCell = UITableViewCell()
            print("Unexpected: the cell is not a custom cell.")
        }
        
        return finalCell
    }
}

