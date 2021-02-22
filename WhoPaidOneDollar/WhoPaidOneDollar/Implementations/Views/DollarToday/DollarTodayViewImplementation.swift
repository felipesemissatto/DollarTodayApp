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
           
            cell.labelNameCurrency.text = data[indexPath.row].nameCurrency
            cell.labelValue.text = String(data[indexPath.row].value)
            
            let countryInfos = infosFromNameCurrency(nameCurrency: data[indexPath.row].nameCurrency)
            cell.imageViewFlag.image = countryInfos.image
            cell.labelCountry.text = countryInfos.country
            cell.labelSymbol.text = countryInfos.symbol
            
            return cell
        } else {
            let cell = UITableViewCell.init()
            cell.textLabel?.text = String(data[indexPath.row].value)
            return cell
        }
    }
    
    func infosFromNameCurrency(nameCurrency: String) -> (currency: String, image: UIImage?, symbol: String, country: String){
        
        switch nameCurrency {
        case Currencies.CAD.info.currency:
            return Currencies.CAD.info
        case Currencies.HKD.info.currency:
            return Currencies.HKD.info
        case Currencies.BRL.info.currency:
            return Currencies.BRL.info
        case Currencies.ISK.info.currency:
            return Currencies.ISK.info
        case Currencies.PHP.info.currency:
            return Currencies.PHP.info
        case Currencies.DKK.info.currency:
            return Currencies.DKK.info
        case Currencies.HUF.info.currency:
            return Currencies.HUF.info
        case Currencies.CZK.info.currency:
            return Currencies.CZK.info
        case Currencies.GBP.info.currency:
            return Currencies.GBP.info
        case Currencies.RON.info.currency:
            return Currencies.RON.info
        case Currencies.SEK.info.currency:
            return Currencies.SEK.info
        case Currencies.IDR.info.currency:
            return Currencies.IDR.info
        case Currencies.INR.info.currency:
            return Currencies.INR.info
        case Currencies.RUB.info.currency:
            return Currencies.RUB.info
        case Currencies.HRK.info.currency:
            return Currencies.HRK.info
        case Currencies.JPY.info.currency:
            return Currencies.JPY.info
        case Currencies.THB.info.currency:
            return Currencies.THB.info
        case Currencies.CHF.info.currency:
            return Currencies.CHF.info
        case Currencies.EUR.info.currency:
            return Currencies.EUR.info
        case Currencies.BGN.info.currency:
            return Currencies.BGN.info
        case Currencies.TRY.info.currency:
            return Currencies.TRY.info
        case Currencies.CNY.info.currency:
            return Currencies.CNY.info
        case Currencies.NOK.info.currency:
            return Currencies.NOK.info
        case Currencies.NZD.info.currency:
            return Currencies.NZD.info
        case Currencies.ZAR.info.currency:
            return Currencies.ZAR.info
        case Currencies.USD.info.currency:
            return Currencies.USD.info
        case Currencies.MXN.info.currency:
            return Currencies.MXN.info
        case Currencies.SGD.info.currency:
            return Currencies.SGD.info
        case Currencies.AUD.info.currency:
            return Currencies.AUD.info
        case Currencies.ILS.info.currency:
            return Currencies.ILS.info
        case Currencies.KRW.info.currency:
            return Currencies.KRW.info
        case Currencies.PLN.info.currency:
            return Currencies.PLN.info
        default:
            return("", nil, "", "")
        }
    }
}
