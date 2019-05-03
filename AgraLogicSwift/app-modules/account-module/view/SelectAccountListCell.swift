//
//  SelectAccountListCell.swift
//  AgraLogicSwift
//
//  Created by Reena on 02/05/19.
//  Copyright © 2019 RNaura. All rights reserved.
//

import UIKit

class SelectAccountListCell: UITableViewCell {

    @IBOutlet weak var lblSerialNumber: UILabel!
    
    @IBOutlet weak var vSerialNumber: UIView!
    
    @IBOutlet weak var lblAccountName: UILabel!
    
    @IBOutlet weak var lblAcreage: UILabel!
    
    @IBOutlet weak var lblCrops: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
