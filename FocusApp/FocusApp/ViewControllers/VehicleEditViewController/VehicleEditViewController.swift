//
//  VehicleEditInfoViewController.swift
//  FocusApp
//
//  Created by Andrew on 14.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import UIKit

final class VehicleEditViewController: UIViewController {
    
    @IBOutlet weak var releaseYearEdit: UITextField!
    @IBOutlet weak var modelEdit: UITextField!
    @IBOutlet weak var vendorEdit: UITextField!
    @IBOutlet weak var bodyTypeEdit: UITextField!
    
    var vehicle: Vehicle?
    var isNewVehicleCreation = false
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if validateInput() {
            if isNewVehicleCreation {
                let newVehicle = Vehicle()
                newVehicle.releaseYear = releaseYearEdit.text!
                newVehicle.model = modelEdit.text!
                newVehicle.vendor = vendorEdit.text!
                newVehicle.bodyType = bodyTypeEdit.text!
                StoreService.shared.store(vehicle: newVehicle)
            } else {
                StoreService.shared.beginTransaction()
                vehicle?.releaseYear = releaseYearEdit.text!
                vehicle?.model = modelEdit.text!
                vehicle?.vendor = vendorEdit.text!
                vehicle?.bodyType = bodyTypeEdit.text!
                StoreService.shared.commitTransaction()
            }
            navigationController?.popViewController(animated: true)
        } else {
            showAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        releaseYearEdit.text = vehicle?.releaseYear
        modelEdit.text = vehicle?.model
        vendorEdit.text = vehicle?.vendor
        bodyTypeEdit.text = vehicle?.bodyType
    }
    
    private func validateInput() -> Bool {
        guard (!releaseYearEdit.text!.isEmpty), (!modelEdit.text!.isEmpty), (!vendorEdit.text!.isEmpty), (!bodyTypeEdit.text!.isEmpty) else {
            return false
        }
        return true
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Input Error", message: "Inputs can't be empty!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
