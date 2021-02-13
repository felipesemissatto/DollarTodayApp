//
//  MessageViewImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 12/02/21.
//

import UIKit
import AuthenticationServices

class MessageViewImplementation: UIView, MessageViewProtocol {
    // MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var viewController: MessageViewControllerProtocol
    
    // MARK: - Private attributes
    private var data: [Message]
    
    // MARK: - Init methods
    required init(data: [Message], viewController: MessageViewControllerProtocol) {
        self.data = data
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
        setupTableView()
        referenceXib(nibName: "MessageTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("MessageViewImplementation", owner: self, options: nil),
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
    
    // MARK: -Objc Functions
    @objc private func addUser() {
        // Some code, e.g.
//        let storyboard = UIStoryboard(name: "CreateNewUser", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "createUser") as! CreateUserVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension Table View Data Source Methods
extension MessageViewImplementation: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
