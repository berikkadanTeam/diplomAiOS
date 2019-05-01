//
//  Menu.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 3/26/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import ObjectMapper

class DishType: Mappable {
    var id: Int = 0
    var title: String = ""
    var dishes: [Dish] = [Dish]()
    var isSelected: Bool = false
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}


