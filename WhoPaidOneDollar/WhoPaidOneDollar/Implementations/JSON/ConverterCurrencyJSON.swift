//
//  ConverterCurrencyJSON.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import SwiftyJSON

//    MARK: - Error Handling
enum ErrorParseCurrency: String, Error {
    case noCurrency = "Error: It was not possible to find the currency field to create the currency object. Check ErrorParseCurrency."
}


class ConverterCurrencyJSON: ConverterCurrencyJSONProtocol {
    
    // MARK: - ConverterPersonJSONProtocol methods
    func parserJSONCurrencies(json: JSON) -> [Currency] {
        var currenciesArray: [Currency] = []
        
        if let response = json["rates"].dictionary {
             createNewCurrency(response,"CAD",&currenciesArray)
             createNewCurrency(response,"HKD",&currenciesArray)
             createNewCurrency(response,"ISK",&currenciesArray)
             createNewCurrency(response,"PHP",&currenciesArray)
            
             createNewCurrency(response,"DKK",&currenciesArray)
             createNewCurrency(response,"HUF",&currenciesArray)
             createNewCurrency(response,"CZK",&currenciesArray)
             createNewCurrency(response,"GBP",&currenciesArray)
            
             createNewCurrency(response,"RON",&currenciesArray)
             createNewCurrency(response,"SEK",&currenciesArray)
             createNewCurrency(response,"IDR",&currenciesArray)
             createNewCurrency(response,"INR",&currenciesArray)
            
             createNewCurrency(response,"BRL",&currenciesArray)
             createNewCurrency(response,"RUB",&currenciesArray)
             createNewCurrency(response,"HRK",&currenciesArray)
             createNewCurrency(response,"JPY",&currenciesArray)

             createNewCurrency(response,"THB",&currenciesArray)
             createNewCurrency(response,"CHF",&currenciesArray)
             createNewCurrency(response,"EUR",&currenciesArray)
             createNewCurrency(response,"BGN",&currenciesArray)
            
             createNewCurrency(response,"TRY",&currenciesArray)
             createNewCurrency(response,"CNY",&currenciesArray)
             createNewCurrency(response,"NOK",&currenciesArray)
             createNewCurrency(response,"NZD",&currenciesArray)
            
             createNewCurrency(response,"ZAR",&currenciesArray)
             createNewCurrency(response,"USD",&currenciesArray)
             createNewCurrency(response,"MXN",&currenciesArray)
             createNewCurrency(response,"SGD",&currenciesArray)
            
             createNewCurrency(response,"AUD",&currenciesArray)
             createNewCurrency(response,"ILS",&currenciesArray)
             createNewCurrency(response,"KRW",&currenciesArray)
             createNewCurrency(response,"PLN",&currenciesArray)
        }
        
        return currenciesArray
    }
    
    func createNewCurrency(_ response: [String : JSON],
                           _ currency: String,
                           _ currenciesArray: inout [Currency]) {
        
        if let value = response[currency]?.number {
            let y = (value.floatValue*100).rounded()/100
            currenciesArray.append(Currency(nameCurrency: currency,
                                            value: y))
        }
    }
}
