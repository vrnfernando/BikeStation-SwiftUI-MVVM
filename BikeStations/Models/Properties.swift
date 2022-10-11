//
//  Properties.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct Properties: Decodable, Hashable, Identifiable {
    var id: String { id }
    var bikes : String?
    var bike_racks : String?
    var free_racks : String?
    var label : String?
    var updated : String?
}
