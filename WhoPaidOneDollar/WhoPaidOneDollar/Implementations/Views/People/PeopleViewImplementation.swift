//
//  PeopleViewImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 11/02/21.
//

import UIKit
import AuthenticationServices

class PeopleViewImplementation: UIView, PeopleViewProtocol {
    
    // MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var viewController: PeopleViewControllerProtocol
    
    // MARK: - Private attributes
    private var data: [Person]
    
    // MARK: - Init methods
    required init(data: [Person], viewController: PeopleViewControllerProtocol) {
        self.data = data
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
        setupTableView()
        referenceXib(nibName: "PersonTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("PeopleViewImplementation", owner: self, options: nil),
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
extension PeopleViewImplementation: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell {
            cell.imageViewProfilePic.setCustomImage(data[indexPath.row].photoUrl?.absoluteString)
            cell.labelPersonName.text = data[indexPath.row].name
            
            if let twitter = data[indexPath.row].twitter {
                if twitter != ""{
                    cell.labelTwitter.text = twitter
                } else {
                    cell.viewTwitter.isHidden = true
                    cell.imageViewTwitter.isHidden = true
                }
            } else {
                cell.viewTwitter.isHidden = true
                cell.imageViewTwitter.isHidden = true
            }
            
            if let instagram = data[indexPath.row].instagram {
                if instagram != "" {
                    cell.labelInstagram.text = instagram
                } else {
                    cell.viewInstagram.isHidden = true
                    cell.imageViewInstagram.isHidden = true
                }
            } else {
                cell.viewTwitter.isHidden = true
                cell.imageViewTwitter.isHidden = true
            }
            
            
            cell.labelDate.text = data[indexPath.row].date.description[0 ..< 11]
            
            return cell
        } else {
            let cell = UITableViewCell.init()
            cell.textLabel?.text = data[indexPath.row].name
            return cell
        }
    }
}
