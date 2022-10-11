//
//  BikeStationListViewModel.swift
//  BikeStations
//
//  Created by Vishwa Fernando on 2022-10-11.
//

import Foundation
import SwiftUI
import Combine

final class BikeStationListViewModel: ObservableObject, UnidirectionalDataFlowType {
    typealias InputType = Input
    
    private var cancellables: [AnyCancellable] = []
    
    // MARK: Input
    enum Input {
        case onApper
    }
    
    func apply(_ input: Input) {
        switch input {
        case .onApper: onAppearSubject.send(())
        }
    }
    
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    
    // MARK: Output
    @Published private(set) var bikeStationList: [BikeStation] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    @Published private(set) var shouldShowIcon = false
    
    private let responseSubject = PassthroughSubject<SearchBikeStationResponse, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private let trackingSubject = PassthroughSubject<TrackEventType, Never>()
    
    private let apiService: APIServiceType
    private let trackerService: TrackerType
    private let experimentService: ExperimentServiceType
    
    init(apiService: APIServiceType = APIService(),
         trackService: TrackerType = TrackerService(),
         experimentService: ExperimentServiceType = ExperimentService()) {
         self.apiService = apiService
         self.trackerService = trackService
         self.experimentService = experimentService
        
         bindInputs()
         bindOutputs()
    }
    
    private func bindInputs() {
        let request = SearchBikeStationRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<SearchBikeStationResponse, Never> in
                        self?.errorSubject.send(error)
                        return .init()
                    }
            }
        
            let responseStream = responsePublisher
                .share()
                .subscribe(responseSubject)
        
            let trackingSubjectStream = trackingSubject
                .sink(receiveValue: trackerService.log)
           
            let trackingStream = onAppearSubject
                .map { .listView }
                .subscribe(trackingSubject)
        
        cancellables += [
                responseStream,
                trackingSubjectStream,
                trackingStream
            ]
    }
    
    private func bindOutputs() {
        let bikeStationsStream = responseSubject
            .map { $0.features }
            .assign(to: \.bikeStationList, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in
                print(self.errorSubject)
                switch error {
                case .responseError: return "network error"
                case .parseError: return "parse error"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        let showIconStream = onAppearSubject
            .map { [experimentService] _ in
                experimentService.experiment(for: .showIcon)
            }
            .assign(to: \.shouldShowIcon, on: self)
        
        cancellables += [
            bikeStationsStream,
            errorMessageStream,
            errorStream,
            showIconStream
        ]
        
    }
    
    
}
