//
//  ViewModel.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import Foundation

class FindingFalconeViewModel: ObservableObject {
    @Published var planets: [Planet] = []
    @Published var vehicles: [Vehicle] = []
    @Published var selectedPlanets: [Planet?] = [nil, nil, nil, nil]
    @Published var selectedVehicles: [Vehicle?] = [nil, nil, nil, nil]
    @Published var isLoading = false
    @Published var isFinding = false
    @Published var result: FindFalconeResponse?

    init() {
        fetchData()
    }

    func fetchData() {
        isLoading = true
        APIService.shared.fetchPlanets { [weak self] planets in
            DispatchQueue.main.async {
                self?.planets = planets ?? []
            }
            APIService.shared.fetchVehicles { [weak self] vehicles in
                DispatchQueue.main.async {
                    self?.vehicles = vehicles ?? []
                    self?.isLoading = false
                }
            }
        }
    }


    func findFalcone() {
        isFinding = true
        APIService.shared.getToken { [weak self] token in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if token == nil {
                    self.isFinding = false
                    return
                }
            }

            let planets = self.selectedPlanets.compactMap { $0?.name }
            let vehicles = self.selectedVehicles.compactMap { $0?.name }

            APIService.shared.findFalcone(token: token!, planets: planets, vehicles: vehicles) { [weak self] response in
                DispatchQueue.main.async {
                    self?.result = response
                    self?.isFinding = false
                }
            }
        }
    }


}
