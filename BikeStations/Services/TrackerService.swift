//
//  TrackerService.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation

enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class TrackerService: TrackerType {
    
    func log(type: TrackEventType) {
    }
}
