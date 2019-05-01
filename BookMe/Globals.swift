//
//  Globals.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import Foundation

class Globals {
    
    static let main = Globals()
    
    var url = "http://5.23.55.101/api"
    var imageUrl = "http://5.23.55.101/api/booking/RestaurantsAvatar?filename="
    var restarauntMenuImageUrl = "http://5.23.55.101/api/restinfo/RestaurantsMenu?filename="
    
    var tint = RGBColor(0x00ADB5)
    
    var dishTypes = [DishType]()
    
    func getDishTypes() {
        UserAPI.getDishTypes { (result, error) in
            if let res = result {
                self.dishTypes = res
            }
        }
    }
}


