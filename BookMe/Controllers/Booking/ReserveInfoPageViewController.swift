//
//  ReserveInfoPageViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/16/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit

class ReserveInfoPageViewController: UIViewController {

    @IBOutlet weak var showDate: UILabel!
    
    @IBOutlet weak var dateButton: UIButton!
    
    
    @IBAction func dateButtonx(_ sender: UIButton) {
        var picker : UIDatePicker = UIDatePicker()
        picker.datePickerMode = UIDatePicker.Mode.date
        self.view.addSubview(picker)
    }
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 375, y: 626, width: 375, height: 41)
        button.backgroundColor = RGBColor(0x00adb5)
        button.setTitle("Готово ", for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)),
                         for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func buttonAction(_ : UIButton) {
        
        
    
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
