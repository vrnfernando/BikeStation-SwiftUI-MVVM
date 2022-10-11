//
//  SearchBikeStationRequest.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation

struct SearchBikeStationRequest: APIRequestType {
    typealias Response = SearchBikeStationResponse
    
    var path: String { return "/mim/plan/map_service.html?" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "mtype", value: "pub_transport"),
            .init(name: "co", value: "stacje_rowerowe")
        ]
    }
}
