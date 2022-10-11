//
//  BikeStationListView.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct BikeStationListView: View {
    @ObservedObject var viewModel: BikeStationListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.bikeStationList) { station in
                
                NavigationLink(destination: BikeStationMapView(viewModel: BikeStationMapViewModel(bikeStation: station))){
                BikeStationListRow(station: station)
                }
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            })
            .navigationBarTitle(Text("Stations"))
        }
        .onAppear(perform: { self.viewModel.apply(.onApper) })
    }
}

struct BikeStationListView_previews: PreviewProvider {
    static var previews: some View {
        BikeStationListView(viewModel: .init())
    }
}
