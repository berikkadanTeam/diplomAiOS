//
//  RestaurantsViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/29/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit




class RestaurantsViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrData = [JsonModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
    
        
    }
    
    func jsonParsing() {
        let url = URL(string: "http://5.23.55.101/api/Restaurants/GetRestaurants")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else{return}
            do{
                let json = try JSON(data: data)
                let results = json[]
                for arr in results.arrayValue{
                self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

    }

extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestCell", for: indexPath) as! RestaurantsTableViewCell
        cell.nameLabel.text = arrData[indexPath.row].name
        cell.addressLabel.text = arrData[indexPath.row].address
        return cell
    }
    
    
}
