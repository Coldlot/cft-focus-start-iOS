//
//  StoreService.swift
//  FocusApp
//
//  Created by Andrew on 14.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import Foundation
import RealmSwift

final class StoreService {
    static let shared = StoreService()
    
    private var realm: Realm {
        guard let realm = try? Realm() else {
            fatalError("Can't initialize Realm")
        }
        return realm
    }
    
    func getAllVehicles() -> [Vehicle]? {
        let vehicles = realm.objects(Vehicle.self).toArray(Vehicle.self) as [Vehicle]
        return vehicles.count > 0 ? vehicles : nil
    }
    
    func store(vehicle: Vehicle) {
        do {
            try realm.write {
                realm.add(vehicle)
            }
        } catch {
            print(error)
        }
    }
    
    func delete(vehicle: Vehicle) {
        try? realm.write {
            realm.delete(vehicle)
        }
    }
    
}

//MARK: - Extension of Results
extension Results {
    func toArray<T>(_ ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
