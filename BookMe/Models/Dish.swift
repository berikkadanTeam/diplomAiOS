//
//  Dish.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 3/31/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import ObjectMapper

public class Dish: Mappable {
    var id : String?
    var nameOfDish : String?
    var typeId : Int = 0
    var composition: String?
    var price: Int = 0
    var restaurantId: Int = 0
    var title: String = ""
    var fileName: String = ""
    var fileId: String = ""
    var filePath: String = ""
    var dishCount: Int = 0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        nameOfDish <- map["nameOfDish"]
        typeId <- map["typeId"]
        composition <- map["composition"]
        price <- map["price"]
        restaurantId <- map["restaurantId"]
        title <- map["title"]
        fileName <- map["fileName"]
        fileId <- map["fileId"]
        filePath <- map["filePath"]
        dishCount <- map["dishCount"]
    }
}
