//
//  AuthViewController.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/22/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AuthViewController: UIViewController {

    @IBOutlet weak var loginTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var loader: DMLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = DMLoader(view: view)
        loginTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let url = "http://5.23.55.101/api/auth/login"
        
        let parameters = [
            "userName": loginTextfield.text!,
            "password": passwordTextfield.text!
        ]
        
        loader.start()
        Alamofire.request(url, method: .post, parameters: parameters as Parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let token = json["auth_token"].stringValue
                let id = json["id"].stringValue
                //                let expiresIn = json["expires_in"].stringValue
                Keys.current.set(.token, value: token)
                Keys.current.set(.userId, value: id)
                self.loader.stop()
                self.dismiss(animated: true, completion: nil)
            case .failure(let error):
                self.loader.stop()
                print(error)
            }
        }
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
