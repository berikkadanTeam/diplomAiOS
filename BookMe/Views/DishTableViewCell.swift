//
//  DishTableViewCell.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 3/31/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit
import Kingfisher

class DishTableViewCell: UITableViewCell {
    
    let mainView: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    let dishImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        return label
    }()
    let countLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    let priceLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = RGBColor(0x00ADB5)
        label.textAlignment = .right
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        return label
    }()
    
    let minusButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = RGBColor(0x00ADB5)
        button.setTitle("-", for: .normal)
        button.titleLabel?.textColor = .white
        button.tag = 1
        return button
    }()
    let plusButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = RGBColor(0x00ADB5)
        button.setTitle("+", for: .normal)
        button.titleLabel?.textColor = .white
        button.tag = 2
        return button
    }()
    
    var dish: Dish? {
        didSet {
            dishImageView.kf.setImage(with: URL(string: dish?.fileName.toUrl(.restaurantMenu) ?? ""), placeholder: UIImage(named: "placeholder"))
            nameLabel.text = dish?.nameOfDish
            countLabel.text = "Количество: \(dish?.dishCount ?? 0)"
            priceLabel.text = "\(dish?.price ?? 0)₸"
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = RGBColor(0xEEEEEE)
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        [dishImageView, nameLabel, priceLabel, countLabel, minusButton, plusButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview($0)
        }
        
        dishImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
        dishImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0).isActive = true
        dishImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0).isActive = true
        dishImageView.heightAnchor.constraint(equalToConstant: 144).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 20).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -20).isActive = true
        
        plusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        minusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        countLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: -20).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        
        minusButton.layer.cornerRadius = 15
        minusButton.clipsToBounds = true
        plusButton.layer.cornerRadius = 15
        plusButton.clipsToBounds = true
        
        minusButton.addTarget(self, action: #selector(countPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(countPressed), for: .touchUpInside)
    }
    
    @objc func countPressed(sender: UIButton) {
        switch sender.tag {
        case 1:
            print("minus pressed")
        case 2:
            print("plus pressed")
        default:
            return
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
