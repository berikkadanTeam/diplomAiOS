//
//  DishCollectionViewCell.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 4/21/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var menuItem: DishType? {
        didSet {
            nameLabel.text = menuItem?.title
            nameLabel.textColor = (menuItem?.isSelected ?? true) ? .black : .gray
        }
    }
}
