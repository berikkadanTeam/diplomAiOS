//
//  BookingViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 2/3/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var loader: DMLoader!
    
    var restaurants = [Restaurant]()
    var filteredRestaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeRequest()
    }
    
    func setupViews() {
        tableView.backgroundColor = RGBColor(0xEEEEEE)
        loader = DMLoader(view: view)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
        searchBar.delegate = self
    }
    
    func makeRequest() {
        loader.start()
        UserAPI.getRestaurants { (result, error) in
            self.loader.stop()
            if let res = result {
                self.restaurants = res
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRestaurant" {
            let restaurant = sender as! Restaurant
            let vc = segue.destination as! RestaurantInfoViewController
            vc.restaurant = restaurant
        }
    }
}

extension BookingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredRestaurants.count
        }
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantTableViewCell
        let current = isFiltering() ? filteredRestaurants[indexPath.row] : restaurants[indexPath.row]
        cell.restaurant = current
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let current = isFiltering() ? filteredRestaurants[indexPath.row] : restaurants[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toRestaurant", sender: current)
    }
}

extension BookingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRestaurants = restaurants.filter({(restaurant: Restaurant) -> Bool in
            return restaurant.name.lowercased().contains(searchText.lowercased())
        })
        self.tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return !searchBarIsEmpty()
    }
}
