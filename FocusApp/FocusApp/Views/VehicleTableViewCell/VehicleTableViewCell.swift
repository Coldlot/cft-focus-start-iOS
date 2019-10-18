//
//  VehicleTableViewCell.swift
//  FocusApp
//
//  Created by Andrew on 14.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    static let id = "vehicleCell"
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var vendorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
