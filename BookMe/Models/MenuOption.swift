//
//  MenuOption.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 4/1/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Book
    case Orders
    case Delivery
    case Balance
    case Stock
    
    var description: String {
        switch self {
        case .Profile: return "Мой профиль"
        case .Book: return "Мои бронирования"
        case .Orders: return "Мои заказы"
        case .Delivery: return "Мои доставки"
        case .Balance: return "Пополнить баланс"
        case .Stock: return "Акции"
            
            
        }
    }
    
    var image: UIImage {
        switch self {
            case .Profile: return UIImage(named: "icon_profile_rounded") ?? UIImage()
            case .Book: return UIImage(named: "icon_calendar") ?? UIImage()
            case .Orders: return UIImage(named: "icon_clock") ?? UIImage()
            case .Delivery: return UIImage(named: "icon_delivery_blue") ?? UIImage()
            case .Balance: return UIImage(named: "icon_money_heart") ?? UIImage()
            case .Stock: return UIImage(named: "icon_discount") ?? UIImage()
            
        }
    }
    
}
