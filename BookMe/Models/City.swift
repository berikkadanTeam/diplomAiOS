//
//  City.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/21/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import Foundation
import ObjectMapper

class City: Mappable {
    var id: Int = 0
    var cityTitle: String = ""
    var countryId: Int = 0
    
    required init?(map: Map){}

    func mapping(map: Map) {
        id <- map["Id"]
        cityTitle <- map["cityTitle"]
        countryId <- map["countryId"]
    }
}
