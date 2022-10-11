//
//  AnnotationItem.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    var id         = UUID()
    var coordinate : CLLocationCoordinate2D

}
