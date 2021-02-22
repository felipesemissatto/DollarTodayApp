//
//  CurrenciesList.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 22/02/21.
//

import Foundation
import UIKit

enum Currencies {
    case CAD
    case HKD
    case ISK
    case PHP
    case DKK
    case HUF
    case CZK
    case GBP
    case RON
    case SEK
    case IDR
    case INR
    case BRL
    case RUB
    case HRK
    case JPY
    case THB
    case CHF
    case EUR
    case BGN
    case TRY
    case CNY
    case NOK
    case NZD
    case ZAR
    case USD
    case MXN
    case SGD
    case AUD
    case ILS
    case KRW
    case PLN
    
    var info: (image: UIImage?, symbol: String, country: String) {
            switch self {
            case .CAD:
                return (UIImage(named: "canada"),"$", "Canada")
            case .HKD:
                return (UIImage(named: "hongkong"),"$", "Hong Kong")
            case .BRL:
                return (UIImage(named: "brazil"),"R$", "Brazil")
            case .ISK:
                return (UIImage(named: "iceland"),"kr", "Iceland")
            case .PHP:
                return (UIImage(named: "philippines"),"₱", "Philippines")
            case .DKK:
                return (UIImage(named: "denmark"),"kr", "Denmark")
            case .HUF:
                return (UIImage(named: "hungary"),"Ft", "Hungary")
            case .CZK:
                return (UIImage(named: "czechrepublic"),"Kč", "Czech Republic")
            case .GBP:
                return (UIImage(named: "unitedkingdom"),"£", "United Kingdom")
            case .RON:
                return (UIImage(named: "romania"),"lei", "Romania")
            case .SEK:
                return (UIImage(named: "sweden"),"lei", "Sweden")
            case .IDR:
                return (UIImage(named: "indonesia"),"Rp", "Indonesia")
            case .INR:
                return (UIImage(named: "india"),"₹", "India")
            case .RUB:
                return (UIImage(named: "abkhazia"),"₽", "Abkhazia")
            case .HRK:
                return (UIImage(named: "jroatia"),"kn", "Croatia")
            case .JPY:
                return (UIImage(named: "japan"),"¥", "Japan")
            case .THB:
                return (UIImage(named: "thailand"),"฿", "Thailand")
            case .CHF:
                return (UIImage(named: "switzerland"),"Fr.", "Switzerland")
            case .EUR:
                return (UIImage(named: "euro"),"€", "Euro")
            case .BGN:
                return (UIImage(named: "bulgaria"),"лв.", "Bulgaria")
            case .TRY:
                return (UIImage(named: "turkey"),"₺", "Turkey")
            case .CNY:
                return (UIImage(named: "china"),"¥", "China")
            case .NOK:
                return (UIImage(named: "norway"),"kr", "Norway")
            case .NZD:
                return (UIImage(named: "newzealand"),"$", "New Zealand")
            case .ZAR:
                return (UIImage(named: "southafrica"),"R", "South Africa")
            case .USD:
                return (UIImage(named: "unitedstates"),"$", "United States")
            case .MXN:
                return (UIImage(named: "mexico"),"$", "Mexico")
            case .SGD:
                return (UIImage(named: "singapore"),"$", "Singapore")
            case .AUD:
                return (UIImage(named: "australia"),"$", "Australia")
            case .ILS:
                return (UIImage(named: "israel"),"₪", "Israel")
            case .KRW:
                return (UIImage(named: "southkorea"),"₩", "South Korea")
            case .PLN:
                return (UIImage(named: "poland"),"zł", "Poland")
            }
        }
}
