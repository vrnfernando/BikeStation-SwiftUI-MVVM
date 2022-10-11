//
//  APIServiceError.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
