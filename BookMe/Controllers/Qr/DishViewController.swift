//
//  DishViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 3/26/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit


class DishViewController: UIViewController {
    @IBOutlet weak var searchDish: UISearchBar!
    
    @IBOutlet weak var collectionDish: UICollectionView!
    @IBOutlet weak var tableDish: UITableView!
    var loader: DMLoader!
    var dishes = [Dish]()
    var filteredDishes = [Dish]()
    
    var menu = [DishType]()
    var qrModel = QRModel(tableId: "85dfa59e-93b2-4dc0-8152-00e6dcb7d7d6", restaurantId: "e0f164e5-b4f8-4c36-b9f2-35df14579702")
    
    var selectedItemIndex: Int = 0
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionDish.delegate = self
        collectionDish.dataSource = self
        collectionDish.register(DishCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        tableDish.delegate = self
        tableDish.dataSource = self
        tableDish.backgroundColor = RGBColor(0xEEEEEE)
        tableDish.backgroundView?.backgroundColor = RGBColor(0xEEEEEE)
        tableDish.register(DishTableViewCell.self, forCellReuseIdentifier: "dishCell")
        
        UserAPI.getDishTypes { (result, error) in
            if let res = result {
                self.menu = res
                self.menu.first?.isSelected = true
                self.collectionDish.reloadData()
                UserAPI.getDihes(id: self.qrModel.restaurantId) { (result, error) in
                    if let res = result {
                        self.dishes = res
                        for currentType in self.menu {
                            currentType.dishes = self.dishes.filter({ currentType.id == $0.typeId })
                        }
                        self.tableDish.reloadData()
                    }
                }
                
                
            }
        }
    }
}
    
extension DishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredDishes.count
        }
        return menu.count > 0 ? menu[selectedItemIndex].dishes.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell
        cell.dish = menu[selectedItemIndex].dishes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
extension DishViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredDishes = dishes.filter({(dish: Dish) -> Bool in
            return
                dish.title.lowercased().contains(searchText.lowercased())
        })
        self.tableDish.reloadData()
    }
    func searchBarIsEmpty() -> Bool {
        return searchDish.text?.isEmpty ?? true
    }
    func isFiltering() -> Bool {
        return !searchBarIsEmpty()
    }
}

extension DishViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! DishCollectionViewCell
        cell.menuItem = menu[indexPath.row]
        return cell
    }
}

extension DishViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        menu.forEach {
            $0.isSelected = false
        }
        menu[indexPath.row].isSelected = true
        selectedItemIndex = indexPath.row
        collectionDish.reloadData()
        tableDish.reloadData()
    }
}

extension DishViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = menu[indexPath.row].title
        label.sizeToFit()
        return CGSize(width: label.frame.width+20, height: 44)
    }
}
