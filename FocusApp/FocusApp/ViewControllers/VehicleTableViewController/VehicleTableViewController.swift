//
//  VehicleTableViewController.swift
//  FocusApp
//
//  Created by Andrew on 13.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import UIKit

final class VehicleTableViewController: UIViewController {
    
    let cellIdentifier = "vehicleCell"
    @IBOutlet weak var vehicleList: UITableView!
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // open view for info input - good idea to create a popover view here
        // add to array and realm transaction
        // reload tableview data
    }
    
    var vehicles = [Vehicle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "FirstLaunch") == nil {
            firstInitialization()
            defaults.set(false, forKey: "FirstLaunch")
            for i in vehicles {
                StoreService.shared.store(vehicle: i)
            }
        } else {
            guard let result = StoreService.shared.getAllVehicles() else {
                return
            }
            vehicles = result
        }
        
    }
    
    func firstInitialization() {
        let civic = Vehicle()
        civic.model = "Civic"
        civic.releaseYear = "1999"
        civic.bodyType = "Sedan"
        civic.vendor = "Honda"
        vehicles.append(civic)
        
        let skyline = Vehicle()
        skyline.model = "SkyLine"
        skyline.releaseYear = "1998"
        skyline.bodyType = "Coupe"
        skyline.vendor = "Nissan"
        vehicles.append(skyline)
        
        let primera = Vehicle()
        primera.model = "Primera"
        primera.releaseYear = "2001"
        primera.bodyType = "Sedan"
        primera.vendor = "Nissan"
        vehicles.append(primera)
    }
}
