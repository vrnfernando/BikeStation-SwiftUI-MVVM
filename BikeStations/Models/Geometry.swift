//
//  Geometry.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct Geometry: Decodable, Hashable, Identifiable {
    var id: String { id }
    var coordinates: [Double]?
    var type       : String?
}
