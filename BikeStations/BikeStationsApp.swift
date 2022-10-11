//
//  BikeStationsApp.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import SwiftUI

@main
struct BikeStationsApp: App {

    var body: some Scene {
        WindowGroup {
            
            // ContentView
            BikeStationListView(viewModel: BikeStationListViewModel())
            
        }
    }
}
