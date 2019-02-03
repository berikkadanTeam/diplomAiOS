//
//  RestaurantsTableViewCell.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/1/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
