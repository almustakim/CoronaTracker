//
//  SecondViewController.swift
//  CoronaTracker
//
//  Created by AL Mustakim on 18/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myURL = URL(string:"http://www.coronatestbd.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
        webView.reload()
        print("hi hi")
    }
 


}

