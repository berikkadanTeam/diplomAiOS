//
//  Restaraunts.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/29/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

struct JsonModel{
    var name: String = ""
    var address: String = ""
    
    init(){
        
        
    }
    
    init(json:JSON){
        name = json["name"].stringValue
        address = json["address"].stringValue
    }
}

