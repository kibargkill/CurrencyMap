//
//  Json.swift
//  map
//
//  Created by mymac on 24.11.2017.
//  Copyright © 2017 mymac. All rights reserved.
//

import Foundation

struct JsonFinanceUA: Decodable {
    var sourceID:String?
    var data: String?
    var organizations: [OrganizationName?]
    var orgTypes: orgTypesVal?
    var currencies: currenciesType?
//    var regions: String?
//    var cities: String?
}
struct OrganizationName: Decodable {
     var id: String?
    var oldId: Int?
    var orgType: Int?
    var branch: Bool?
    var title: String?
    var regionId: String?
    var cityId: String?
    var phone: String?
    var address: String?
    var link: String?
    var currencies: CurrenciesVal?
}
struct CurrenciesVal: Decodable {
    
    var RUB: AskBid?
    var AED: AskBid?
    var AMD: AskBid?
    var AUD: AskBid?
    var AZN: AskBid?
    var BGN: AskBid?
    var BRL: AskBid?
    var BYN: AskBid?
    var CAD: AskBid?
    var CHF: AskBid?
    var CLP: AskBid?
    var CNY: AskBid?
    var CZK: AskBid?
    var DKK: AskBid?
    var EGP: AskBid?
    var EUR: AskBid?
    var GBP: AskBid?
    var GEL: AskBid?
    var HKD: AskBid?
    var HRK: AskBid?
    var HUF: AskBid?
    var ITS: AskBid?
    var INR: AskBid?
    var FPY: AskBid?
    var KRW: AskBid?
    var KWD: AskBid?
    var KZT: AskBid?
    var LBP: AskBid?
    var MDL: AskBid?
    var MXN: AskBid?
    var NOK: AskBid?
    var NZD: AskBid?
    var PLN: AskBid?
    var RON: AskBid?
    var SAR: AskBid?
    var SEK: AskBid?
    var SGD: AskBid?
    var THB: AskBid?
    var TRY: AskBid?
    var TWD: AskBid?
    var USD: AskBid?
    var VND: AskBid?
}
struct AskBid: Decodable {
    var ask: String?
    var bid: String?
}
struct orgTypesVal: Decodable {
    var one: String?
    var two: String?
}
struct currenciesType: Decodable {
   var AED: String
   var AMD: String
   var AUD: String
   var AZN: String
   var BGN: String
   var BRL: String
   var BYN: String
   var CAD: String
   var CHF: String
   var CLP: String
   var CNY: String
   var CZK: String
   var DKK: String
   var DZD: String
   var EGP: String
   var EUR: String
   var GBP: String
   var GEL: String
   var HKD: String
   var HRK: String
   var HUF: String
   var ILS: String
   var INR: String
   var JPY: String
   var KGS: String
   var KRW: String
   var KWD: String
   var KZT: String
   var LBP: String
   var MDL: String
   var MXN: String
   var NOK: String
   var NZD: String
   var PKR: String
   var PLN: String
   var RON: String
   var RUB: String
   var SAR: String
   var SEK: String
   var SGD: String
   var THB: String
   var TJS: String
   var TMT: String
   var TRY: String
   var TWD: String
   var USD: String
   var VND: String
}


