//
//  VehicleEditInfoViewController.swift
//  FocusApp
//
//  Created by Andrew on 14.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import UIKit

final class VehicleEditInfoViewController: UIViewController {
    
    @IBOutlet weak var releaseYearEdit: UITextField!
    @IBOutlet weak var modelEdit: UITextField!
    @IBOutlet weak var vendorEdit: UITextField!
    @IBOutlet weak var bodyTypeEdit: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
