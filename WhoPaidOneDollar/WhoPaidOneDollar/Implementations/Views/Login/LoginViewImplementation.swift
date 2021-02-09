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
    
    // MARK: - Private Methods
    var textName: String?
    var textTwitter: String?
    var textInstagram: String?
    
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
        tableView.delaysContentTouches = false
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
            
            cell.photoButton.addTarget(self,
                                       action: #selector(tapPhotoButton),
                                       for: .touchUpInside)
            cell.editPhotoButton.addTarget(self,
                                       action: #selector(tapEditPhotoButton),
                                       for: .touchUpInside)
            
            finalCell = cell
        case 1:
            cellIdentifier = "TextFieldsTableViewCell"
            referenceXib(nibName: cellIdentifier)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TextFieldsTableViewCell  else {
                fatalError("The dequeued cell is not an instance of TextFieldsTableViewCell.")
            }
            
            cell.textFieldName.addTarget(self,
                                         action: #selector(edditingTextFieldName),
                                         for: .allEditingEvents)
            cell.textFieldTwitter.addTarget(self,
                                            action: #selector(edditingTextFieldTwitter),
                                            for: .allEditingEvents)
            cell.textFieldInstagram.addTarget(self,
                                              action: #selector(edditingTextFieldInstagram),
                                              for: .allEditingEvents)
            
            finalCell = cell
        case 2:
            cellIdentifier = "ButtonSaveTableViewCell"
            referenceXib(nibName: cellIdentifier)
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ButtonSaveTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ButtonSaveTableViewCell.")
            }
            
            cell.saveButton.addTarget(self,
                                      action: #selector(tapSaveButton),
                                      for: .touchUpInside)
            
            finalCell = cell
            
        default:
            finalCell = UITableViewCell()
            print("Unexpected: the cell is not a custom cell.")
        }
        
        return finalCell
    }
    
    // MARK: -Objc Functions
    @objc func tapPhotoButton(sender: UIButton!) {
        let button: UIButton = sender
        if button.tag == 1 {
            print("oi1")
            
        }
    }
    
    @objc func tapEditPhotoButton(sender: UIButton!) {
        let button: UIButton = sender
        if button.tag == 1 {
            print("oi2")
            
        }
    }
    
    @objc func edditingTextFieldName(textField: UITextField) {
        textName = textField.text
    }
    
    @objc func edditingTextFieldTwitter(textField: UITextField) {
        textTwitter = textField.text
    }
    
    @objc func edditingTextFieldInstagram(textField: UITextField) {
        textInstagram = textField.text
    }
    
    @objc func tapSaveButton(sender: UIButton!) {
        let button: UIButton = sender
        if button.tag == 1 {
            print(textName)
            print(textTwitter)
            print(textInstagram)
            //            viewController.addNewPerson(name: <#T##String#>, photoUrl: <#T##URL?#>, twitter: <#T##String?#>, instagram: <#T##String?#>, date: <#T##NSDate#>)
        }
    }
    
}

