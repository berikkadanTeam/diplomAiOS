//
//  WorkDay.swift
//  BookMe
//
//  Created by Dmitriy Pak on 2/3/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import Foundation
import ObjectMapper


public class WorkDay: Mappable {
    var dayName : String?
    var endTime : String?
    var startTime : String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        dayName <- map["dayName"]
        endTime <- map["endTime"]
        startTime <- map["startTime"]
    }
}
