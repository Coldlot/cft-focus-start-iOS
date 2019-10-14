//
//  Vehicle.swift
//  FocusApp
//
//  Created by Andrew on 13.10.2019.
//  Copyright © 2019 Renewal Studio. All rights reserved.
//

import Foundation
import RealmSwift

final class Vehicle: Object {
    @objc dynamic var releaseYear = ""
    @objc dynamic var vendor = ""
    @objc dynamic var model = ""
    @objc dynamic var bodyType = ""
}
