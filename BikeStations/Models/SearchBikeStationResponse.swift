//
//  SearchBikeStationResponse.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct SearchBikeStationResponse: Decodable {
    var features: [BikeStation]
}
