//
//  BikeStationMapView.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI
import MapKit

struct BikeStationMapView: View {
    @ObservedObject var viewModel: BikeStationMapViewModel
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $viewModel.region,showsUserLocation: true, annotationItems: $viewModel.locations) { item in
                
                MapAnnotation(coordinate: viewModel.region.center) {
                    Label("\( Int((viewModel.bikeStation.properties?.bike_racks ?? "0"))! - Int((viewModel.bikeStation.properties?.free_racks ?? "0"))!)" ,image: "Bike")
                        .foregroundColor(.green)
                }
            }
        }
        
        VStack(alignment: .leading){
            Text(viewModel.bikeStation.id! + " " + (viewModel.bikeStation.properties?.label)!)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Text("600m * Bike Station")
                .font(.system(size: 8.0))
            Spacer()
            Spacer()
            Spacer()
            HStack{
                Spacer()
                VStack{
                    Label("",image: "Bike")
                        .labelStyle(CaptionLabelStyle())
                    Spacer()
                    Text("Available Bikes")
                        .font(.system(size: 8.0))
                    Text("\( Int((viewModel.bikeStation.properties?.bike_racks ?? "0"))! - Int((viewModel.bikeStation.properties?.free_racks ?? "0"))!)")
                        .font(.largeTitle
                            .weight(.bold))
                        .accessibilityAddTraits(.isHeader)
                        .foregroundColor(.green)
                    
                }
                Spacer()
                Spacer()
                VStack{
                    Label("",image: "Lock")
                        .labelStyle(CaptionLabelStyle())
                    Spacer()
                    Text("All Bikes")
                        .font(.system(size: 8.0))
                    Text(viewModel.bikeStation.properties?.bikes ?? "-")
                        .font(.largeTitle
                            .weight(.bold))
                        .accessibilityAddTraits(.isHeader)
                }
                Spacer()
            }
            
        }
        .frame(width: .infinity, height: 130, alignment: .bottom)
        .padding()
        .cornerRadius(10)
    }
}
    
    struct BikeStationMapView_Previews : PreviewProvider {
        static var previews: some View {
            BikeStationMapView(viewModel: BikeStationMapViewModel(bikeStation: BikeStation()))
        }
    }

