//
//  MainTabBarViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/21/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //    jsonParsing()
        
    }
   /* func jsonParsing() {
        let url = URL(string: "http://5.23.55.101/api/Restaurants/GetRestaurants")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else{return}
            do{
                let json = try JSON(data: data)
                print(json)
            }catch{
                print(error.localizedDescription)
            }
            }.resume() */
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         // Keys.current.remove(.token) // to access AUTH
        if Keys.current.get(.token) == "" {
            performSegue(withIdentifier: "toAuth", sender: nil)
        }
    }
    
}
