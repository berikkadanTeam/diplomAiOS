//
//  CitiesViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit
import Alamofire
import FTIndicator
protocol CitiesViewControllerDelegate {
    func passCity(city: String)
}

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: CitiesViewControllerDelegate?
    var loader: DMLoader!
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = DMLoader(view: view)
        tableView.delegate = self
        tableView.dataSource = self
        cityRequest()
    }
    
    func cityRequest() {
        loader.start()
        UserAPI.getCities { (result, error) in
            if let res = result {
                self.cities = res
                self.tableView.reloadData()
                self.loader.stop()
            } else {
                FTIndicator.showError(withMessage: "Произошла ошибка на сервере. Попробуйте позднее.")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        let current = cities[indexPath.row]
        cell.setup(city: current)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passCity(city: cities[indexPath.row].cityTitle)
        dismiss(animated: true, completion: nil)
    }
    
}
