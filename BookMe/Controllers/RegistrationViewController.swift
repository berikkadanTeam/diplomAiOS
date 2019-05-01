//
//  RegistrationViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 1/21/19.
//  Copyright © 2019 Alikhan Ilyassov. All rights reserved.
//

import UIKit
import FTIndicator
import Alamofire
import SwiftyJSON

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var cityTextfield: UITextField!
    
    var loader: DMLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = DMLoader(view: view)
        nameTextfield.delegate = self
        lastNameTextfield.delegate = self
        passwordTextfield.delegate = self
        emailTextfield.delegate = self
        cityTextfield.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-200
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCities" {
            let vc = segue.destination as! CitiesViewController
            vc.delegate = self
        }
    }
    
    @IBAction func chooseCityPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCities", sender: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        let url = "http://5.23.55.101/api/accounts"
        
        let parameters = [
            "email": emailTextfield.text!,
            "password": passwordTextfield.text!,
            "lastName": lastNameTextfield.text!,
            "firstName": nameTextfield.text!,
            "location": cityTextfield.text!
        ]
        
        loader.start()
        Alamofire.request(url, method: .post, parameters: parameters as Parameters, encoding: URLEncoding.httpBody).responseString { response in
            switch response.result {
            case .success:
                self.loader.stop()
                self.performSegue(withIdentifier: "toSuccess", sender: nil)
            case .failure(let error):
                print(error)
                self.loader.stop()
            }
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

extension RegistrationViewController: CitiesViewControllerDelegate {
    func passCity(city: String) {
        cityTextfield.text = city
    }
}


