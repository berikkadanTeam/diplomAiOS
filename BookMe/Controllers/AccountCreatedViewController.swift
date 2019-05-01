//
//  AccountCreatedViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/22/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit

class AccountCreatedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextPressed(_ sender: Any) {
        performSegue(withIdentifier: "toAuthorization", sender: nil)
    }
}
