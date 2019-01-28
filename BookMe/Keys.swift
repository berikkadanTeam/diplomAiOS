//
//  Keys.swift
//  MUL
//
//  Created by Dima on 23.05.2018.
//  Copyright © 2018 fime. All rights reserved.
//

import Foundation

class Keys: NSObject {
    
    static let current = Keys()
    private var defaults = UserDefaults.standard
    
    
    enum KeyTypes{
        case userId, token
        
        var stringValue: String{
            switch self {
            case .userId:
                return "userId"
            case .token:
                return "token"
            }
            
        }
        
        
    }
    
    
    //DEFAULTS & KEYS
    func set(_ key: KeyTypes, value: String){
        self.defaults.set(value, forKey: key.stringValue)
    }
    func get(_ key: KeyTypes)->String{
        if let value = self.defaults.string(forKey: key.stringValue){
            return value
        }
        return ""
    }
    
    func setInt(_ key: KeyTypes, value: Int){
        self.defaults.set(value, forKey: key.stringValue)
    }
    func getInt(_ key: KeyTypes)->Int{
        return self.defaults.integer(forKey: key.stringValue)
    }
    
    func remove(_ key: KeyTypes){
        self.set(key, value: "")
    }
            
}


