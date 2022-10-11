//
//  BikeStationListRow.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

struct BikeStationListRow: View {
    
    @State var station: BikeStation
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(station.id! + " " + (station.properties?.label)!)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Text("600m * Bike Station")
                .font(.system(size: 8.0))
            
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
                    
                    Text("\( Int((station.properties?.bike_racks ?? "0"))! - Int((station.properties?.free_racks ?? "0"))!)")
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
                    
                    Text(station.properties?.bikes ?? "-")
                        .font(.largeTitle
                            .weight(.bold))
                        .accessibilityAddTraits(.isHeader)
                }
                Spacer()
                
            }
        }
        .padding()
        .cornerRadius(10)
        
    }
}

// BikeStationListRow Previews
struct BikeStationListRow_Previews: PreviewProvider {
    static var previews: some View {
        BikeStationListRow(station:
                            BikeStation(geometry: Geometry(coordinates: [0.0], type: ""),
                                        id: "",
                                        type: "",
                                        properties: Properties(bikes: "", bike_racks: "", free_racks: "", label: "", updated: "")))
    }
}

// Set Label Style
struct CaptionLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .scaleEffect(0.8, anchor: .center)
                .frame(width: 5, height: 5, alignment: .center)
            configuration.title
        }
        .font(.caption)
    }
}


//get availble bikes
struct availbleBikesText: Any {
    
    public func getAvailbleBikes(bikeStation: BikeStation)-> String {
        
        let bikeRacks  = Int((bikeStation.properties?.bike_racks ?? "0"))
        let free_racks = Int((bikeStation.properties?.free_racks ?? "0"))
        
        let availbleBikes = Int(bikeRacks!) - Int(free_racks!)
        
        return String(availbleBikes)
    }
}
