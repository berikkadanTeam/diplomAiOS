//
//  ContainerController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 4/4/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    var menuController: MenuViewController!
    
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuViewController()
            menuController.delegate = self as! HomeControllerDelegate
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
  
    func didSelectMenuOption(menuOption: MenuOption ) {
        switch menuOption {
        case .Profile:
            let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
            let profileViewController = storyBoard.instantiateViewController(withIdentifier: "profile") as! ProfileViewController
            self.present(profileViewController, animated: true, completion: nil)
        case .Book:
            print("Show Inbox")
        case .Orders:
            print("Show Notifications")
        case .Delivery:
            print("Show delivery")
        case .Balance:
            print("Show balance")
        case .Stock:
            print("Show stock")
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
