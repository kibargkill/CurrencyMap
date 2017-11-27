//
//  Json.swift
//  map
//
//  Created by mymac on 24.11.2017.
//  Copyright © 2017 mymac. All rights reserved.
//

import Foundation

struct JsonPrivat: Decodable {
//      var organization: [String]?
        var name: String?
        var state: String?
//        var id: String?
        var country: String?
        var city: String?
//        var index: String?
//        var phone: String?
//        var email: String?
        var address: String?
    
    enum CodingKeys: String,CodingKey {
        case name
        case state
//        case id
        case country
        case city
//        case index
//        case phone
//        case email
        case address
    }
    
}
//struct OrganizationName: Decodable {

//}


