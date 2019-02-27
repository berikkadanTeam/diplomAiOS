//
//  Restaurant.swift
//  BookMe
//
//  Created by Dmitriy Pak on 2/3/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import Foundation
import ObjectMapper


public class Restaurant: Mappable {
    var addres : String = ""
    var area : AnyObject?
    var avgCheck : Int = 0
    var city : String = ""
    var cityId : Int = 0
    var delivery : Bool = false
    var descriptionField : String = ""
    var fileName : String = ""
    var filePath : String = ""
    var id : String = ""
    var kitchen : String = ""
    var name : String = ""
    var number : Int = 0
    var seats : Int = 0
    var tables : AnyObject?
    var workDay : [WorkDay]?
    var menu: AnyObject?
    

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        addres <- map["addres"]
        area <- map["area"]
        avgCheck <- map["avgCheck"]
        city <- map["city"]
        cityId <- map["cityId"]
        delivery <- map["delivery"]
        descriptionField <- map["description"]
        fileName <- map["fileName"]
        filePath <- map["filePath"]
        id <- map["id"]
        kitchen <- map["kitchen"]
        name <- map["name"]
        number <- map["number"]
        seats <- map["seats"]
        tables <- map["tables"]
        workDay <- map["workDay"]
    }
}
