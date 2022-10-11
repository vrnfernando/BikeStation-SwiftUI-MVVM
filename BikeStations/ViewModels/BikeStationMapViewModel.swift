//
//  BikeStationMapViewModel.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI
import Combine
import MapKit

final class BikeStationMapViewModel: ObservableObject {
    
    @Published private (set) var bikeStation: BikeStation
    @State var region: MKCoordinateRegion
    @State var locations: [AnnotationItem] = [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 45.8, longitude: -1.34))]
    
    // MapData
    init(bikeStation: BikeStation) {
        self.bikeStation = bikeStation
        let center = CLLocationCoordinate2D(latitude: bikeStation.geometry?.coordinates?[0] ?? 0.0,
                                            longitude: bikeStation.geometry?.coordinates?[1] ?? 0.0)
        
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
            region = MKCoordinateRegion(center: center,
                                        span: span)
        
        locations =  [AnnotationItem(coordinate:CLLocationCoordinate2D(latitude: CLLocationDegrees(CGFloat(bikeStation.geometry?.coordinates?[0] ?? 0.0)), longitude: CLLocationDegrees(CGFloat(bikeStation.geometry?.coordinates?[1] ?? 0.0))))]
        
    }
}
