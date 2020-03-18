//
//  TableViewCell.swift
//  CoronaTracker
//
//  Created by AL Mustakim on 18/3/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryImageView: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var efected: UILabel!
    
    @IBOutlet weak var deth: UILabel!
    @IBOutlet weak var recover: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        efected.layer.masksToBounds = true
        deth.layer.masksToBounds = true
        recover.layer.masksToBounds = true
        
        efected.layer.cornerRadius = 12
        deth.layer.cornerRadius = 12
        recover.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
