//
//  Currency.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import UIKit

class Currency {
    private(set) var nameCurrency: String
    private(set) var value: Float
    private(set) var country: String?
    private(set) var symbol: String?
    private(set) var lastDateUpdated: String?
    private(set) var flagImage: UIImage?
    
    init(nameCurrency: String,
         value: Float,
         country: String?,
         symbol: String?,
         lastDateUpdated: String?,
         flagImage: UIImage?){
        self.nameCurrency = nameCurrency
        self.value = value
        self.country = country
        self.symbol = symbol
        self.lastDateUpdated = lastDateUpdated
        self.flagImage = flagImage
    }
}
