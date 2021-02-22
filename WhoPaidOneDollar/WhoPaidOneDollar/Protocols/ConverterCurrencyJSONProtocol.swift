//
//  ConverterCurrencyJSONProtocol.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import SwiftyJSON

protocol ConverterCurrencyJSONProtocol {
    /**
    Method that converts a JSON in a list of currencies.

    - parameter json: JSON object which contains a list of currencies.

    */
    func parserJSONCurrencies(json: JSON) -> [Currency]
}
