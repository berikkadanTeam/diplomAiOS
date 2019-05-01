//
//  MenuViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/22/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
   // var nameArray = [Menu]()
   // var currentNameArray = [Menu]()
    
    override func viewDidLoad() {

        super.viewDidLoad()
    configureTableView()
       
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        
    }
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    




    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as?
        MenuTableViewCell else {
            return UITableViewCell()
            
        }
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.menuLabel.text = menuOption?.description
        cell.menuImage.image = menuOption?.image
        return cell
    }

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 72
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
       
    }

}
