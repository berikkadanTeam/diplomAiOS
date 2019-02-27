//
//  MenuViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/22/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var nameArray = [Menu]()
    var currentNameArray = [Menu]()
    
    override func viewDidLoad() {

        super.viewDidLoad()
  setUpMain()
       
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        
    }
    
    private func setUpMain(){
        nameArray.append(Menu(imageMenu: "icon_profile_rounded", title: "Мой профиль"))
        nameArray.append(Menu(imageMenu: "icon_calendar", title: "Мои бронирования"))
        nameArray.append(Menu(imageMenu: "icon_clock", title: "Мои заказы"))
        nameArray.append(Menu(imageMenu: "icon_delivery_blue", title: "Мои доставки"))
        nameArray.append(Menu(imageMenu: "icon_money_heart", title: "Пополнить баланс"))
        nameArray.append(Menu(imageMenu: "icon_discount", title: "Акции"))
        
        
            currentNameArray = nameArray
    

}


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as?
        MenuTableViewCell else {
            return UITableViewCell()
            
        }
        
        cell.menuLabel.text = currentNameArray[indexPath.row].title
        cell.menuImage.image = UIImage(named: currentNameArray[indexPath.row].imageMenu)
        return cell
    }

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 72
}

}
