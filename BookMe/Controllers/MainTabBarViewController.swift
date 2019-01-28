//
//  MainTabBarViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//       Keys.current.remove(.token) // to access AUTH
        if Keys.current.get(.token) == "" {
            performSegue(withIdentifier: "toAuth", sender: nil)
        }
    }
    
}
