//
//  RestaurantInfoViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 2/3/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class RestaurantInfoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var kitchenLabel: UILabel!
    @IBOutlet weak var averageCheckLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var mapView: UIView!
    
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let res = restaurant {
            nameLabel.text = res.name
            addressLabel.text = res.addres
            kitchenLabel.attributedText = attributeText(["Кухня: ".toAttributeText(isBold: true), res.kitchen.toAttributeText(isBold: false)])
            averageCheckLabel.attributedText = attributeText(["Средний чек:  ".toAttributeText(isBold: true), "\(res.avgCheck)".toAttributeText(isBold: false)])
            deliveryLabel.attributedText = attributeText(["Доставка: ".toAttributeText(isBold: true), res.delivery.toString().toAttributeText(isBold: false)])
            seatsLabel.attributedText = attributeText(["Количество посадочных мест: ".toAttributeText(isBold: true), "\(res.seats)".toAttributeText(isBold: false)])
            callView.layer.borderWidth = 1
            callView.layer.borderColor = RGBColor(0x00adb5).cgColor
            
            mapView.layer.borderWidth = 1
            mapView.layer.borderColor = RGBColor(0x00adb5).cgColor
            
            
        }
        
        self.tabBarController?.tabBar.isHidden = true
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 375, y: 626, width: 375, height: 41)
        button.backgroundColor = RGBColor(0x00adb5)
        button.setTitle("Забронировать ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)),
                         for: .touchUpInside)
        self.view.addSubview(button)
    }
       @objc func buttonAction(_ : UIButton) {
        self.performSegue(withIdentifier: "webSeg", sender: self)
        
        }
    

    @IBAction func callButtonPressed(_ sender: Any) {
    }
    
    @IBAction func onMapButtonPressed(_ sender: Any) {
   
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?){
   

    var vc  = segue.destination as! webViewViewController
    let res = restaurant
    vc.rsText = (res?.id)!
}

}
