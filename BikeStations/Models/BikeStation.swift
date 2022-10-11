//
//  BikeStation.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct BikeStation: Decodable, Hashable, Identifiable {
    var geometry   : Geometry?
    var id         : String?
    var type       : String?
    var properties : Properties?
}
