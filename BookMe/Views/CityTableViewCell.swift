//
//  CityTableViewCell.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityLabel: UILabel!
    
    var city: City!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(city: City) {
        self.city = city
        cityLabel.text = self.city.cityTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
