//
//  UnidirectionalDataFlowType.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
