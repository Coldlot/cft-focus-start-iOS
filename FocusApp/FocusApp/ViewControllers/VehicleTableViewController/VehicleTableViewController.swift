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
    let editVCIdentifier = "VehicleEditViewController"
    @IBOutlet weak var vehicleList: UITableView!
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let creationVC = storyboard?.instantiateViewController(withIdentifier: editVCIdentifier) as! VehicleEditViewController
        creationVC.isNewVehicleCreation = true
        navigationController?.pushViewController(creationVC, animated: true)
    }
    
    var vehicles = [Vehicle]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        DispatchQueue.main.async {
            self.vehicleList.reloadData()
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
