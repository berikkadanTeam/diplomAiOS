//
//  ProfileViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/27/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ProfImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ProfImage.layer.cornerRadius = self.ProfImage.frame.size.width / 2
        ProfImage.clipsToBounds = true
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
