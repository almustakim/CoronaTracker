//
//  DetailViewController.swift
//  CoronaTracker
//
//  Created by AL Mustakim on 19/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var deth: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!
    
    var cn = String()
    var totl = String()
    var dth = String()
    var rcvrd = String()
    var last = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DataPass()
    }
    

    func DataPass(){
        countryName.text = cn
        total.text = totl
        deth.text = dth
        recovered.text = rcvrd
        lastUpdated.text = "Last Updated : \(last)"
    }

}
