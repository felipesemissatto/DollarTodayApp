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
    
    var info: (currency: String, image: UIImage?, symbol: String, country: String) {
            switch self {
            case .CAD:
                return ("CAD", UIImage(named: "canada"),"$", "Canada")
            case .HKD:
                return ("HKD", UIImage(named: "hongkong"),"$", "Hong Kong")
            case .BRL:
                return ("BRL", UIImage(named: "brazil"),"R$", "Brazil")
            case .ISK:
                return ("ISK", UIImage(named: "iceland"),"kr", "Iceland")
            case .PHP:
                return ("PHP", UIImage(named: "philippines"),"₱", "Philippines")
            case .DKK:
                return ("DKK", UIImage(named: "denmark"),"kr", "Denmark")
            case .HUF:
                return ("HUF", UIImage(named: "hungary"),"Ft", "Hungary")
            case .CZK:
                return ("CZK", UIImage(named: "czechrepublic"),"Kč", "Czech Republic")
            case .GBP:
                return ("GBP", UIImage(named: "unitedkingdom"),"£", "United Kingdom")
            case .RON:
                return ("RON", UIImage(named: "romania"),"lei", "Romania")
            case .SEK:
                return ("SEK", UIImage(named: "sweden"),"lei", "Sweden")
            case .IDR:
                return ("IDR", UIImage(named: "indonesia"),"Rp", "Indonesia")
            case .INR:
                return ("INR", UIImage(named: "india"),"₹", "India")
            case .RUB:
                return ("RUB", UIImage(named: "russia"),"₽", "Russia")
            case .HRK:
                return ("HRK", UIImage(named: "croatia"),"kn", "Croatia")
            case .JPY:
                return ("JPY", UIImage(named: "japan"),"¥", "Japan")
            case .THB:
                return ("THB", UIImage(named: "thailand"),"฿", "Thailand")
            case .CHF:
                return ("CHF", UIImage(named: "switzerland"),"Fr.", "Switzerland")
            case .EUR:
                return ("EUR", UIImage(named: "euro"),"€", "Euro")
            case .BGN:
                return ("BGN", UIImage(named: "bulgaria"),"лв.", "Bulgaria")
            case .TRY:
                return ("TRY", UIImage(named: "turkey"),"₺", "Turkey")
            case .CNY:
                return ("CNY", UIImage(named: "china"),"¥", "China")
            case .NOK:
                return ("NOK", UIImage(named: "norway"),"kr", "Norway")
            case .NZD:
                return ("NZD", UIImage(named: "newzealand"),"$", "New Zealand")
            case .ZAR:
                return ("ZAR", UIImage(named: "southafrica"),"R", "South Africa")
            case .USD:
                return ("USD", UIImage(named: "unitedstates"),"$", "United States")
            case .MXN:
                return ("MXN", UIImage(named: "mexico"),"$", "Mexico")
            case .SGD:
                return ("SGD", UIImage(named: "singapore"),"$", "Singapore")
            case .AUD:
                return ("AUD", UIImage(named: "australia"),"$", "Australia")
            case .ILS:
                return ("ILS", UIImage(named: "israel"),"₪", "Israel")
            case .KRW:
                return ("KRW", UIImage(named: "southkorea"),"₩", "South Korea")
            case .PLN:
                return ("PLN", UIImage(named: "poland"),"zł", "Poland")
            }
        }
}
