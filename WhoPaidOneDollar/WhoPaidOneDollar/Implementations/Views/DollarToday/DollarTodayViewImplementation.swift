//
//  DollarTodayViewImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import UIKit
import AuthenticationServices

class DollarTodayViewImplementation:  UIView, DollarTodayViewProtocol {
    // MARK: -IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Dependencies
    var viewController: DollarTodayViewControllerProtocol
    
    // MARK: - Private attributes
    private var data: [Currency]
    
    // MARK: - Init methods
    required init(data: [Currency], viewController: DollarTodayViewControllerProtocol) {
        self.data = data
        self.viewController = viewController
        super.init(frame: CGRect.zero)
        initFromNib()
        setupTableView()
        referenceXib(nibName: "CurrencyTableViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initFromNib() {
        if let nib = Bundle.main.loadNibNamed("DollarTodayViewImplementation", owner: self, options: nil),
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
extension DollarTodayViewImplementation: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as? CurrencyTableViewCell {
           
            
            return cell
        } else {
            let cell = UITableViewCell.init()
            cell.textLabel?.text = String(data[indexPath.row].value)
            return cell
        }
    }
}
