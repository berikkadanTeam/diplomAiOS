//
//  RestaurantTableViewCell.swift
//  BookMe
//
//  Created by Dmitriy Pak on 2/3/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var restaurant: Restaurant? {
        didSet {
            if let res = restaurant {
                restaurantImage.kf.setImage(with: URL(string: res.fileName.toUrl(.restaurantAvatar)))
                nameLabel.text = res.name
                addressLabel.text = res.addres
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.height / 2
    }
}
