//
//  webViewViewController.swift
//  BookMe
//
//  Created by Alikhan Ilyassov on 2/11/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import UIKit
import WebKit

class webViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    var rsText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL(string: "http://5.23.55.101/#/restaurantid/" + rsText)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
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
