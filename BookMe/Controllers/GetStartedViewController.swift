//
//  GetStartedViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "toRegistration", sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    
}
