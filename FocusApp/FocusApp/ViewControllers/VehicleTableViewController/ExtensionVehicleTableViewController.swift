//
//  ExtensionVehicleTableViewController.swift
//  FocusApp
//
//  Created by Andrew on 13.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import UIKit


//MARK: - UITableViewDataSource
extension VehicleTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VehicleTableViewCell
        let vehicle = vehicles[indexPath.row]
        cell.modelLabel.text = vehicle.model
        cell.vendorLabel.text = vehicle.vendor
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}


//MARK: - UITableViewDelegate
extension VehicleTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {action, view, completionHandler in
            let vehicle = self.vehicles[indexPath.row]
            self.vehicles.remove(at: indexPath.row)
            self.vehicleList.deleteRows(at: [indexPath], with: .automatic)
            StoreService.shared.delete(vehicle: vehicle)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    //MARK: - Seque to Edit Info ViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let editVC = storyboard?.instantiateViewController(identifier: editVCIdentifier) as! VehicleEditViewController
        editVC.vehicle = self.vehicles[indexPath.row]
        editVC.title = "Edit Vehicle Info"
        navigationController?.pushViewController(editVC, animated: true)
    }
}
