//
//  PlanetSelectionView.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import SwiftUI

struct PlanetSelectionView: View {
    @ObservedObject var viewModel: FindingFalconeViewModel
    let index: Int

    var body: some View {
            Form {
                Section(header: Text("Destination \(index + 1)")) {
                    // Planet Picker
                    Picker("Select Planet", selection: $viewModel.selectedPlanets[index]) {
                        Text("None").tag(nil as Planet?) // Add "None" option
                        ForEach(viewModel.planets) { planet in
                            Text(planet.name).tag(planet as Planet?)
                        }
                    }

                    // Vehicle Picker
                    Picker("Select Vehicle", selection: $viewModel.selectedVehicles[index]) {
                        Text("None").tag(nil as Vehicle?) // Add "None" option
                        ForEach(viewModel.vehicles.filter { $0.maxDistance >= (viewModel.selectedPlanets[index]?.distance ?? 0) }) { vehicle in
                            Text("\(vehicle.name) (\(vehicle.totalNo))").tag(vehicle as Vehicle?)
                        }
                    }
                }
            }
    }
}


//struct PlanetSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetSelectionView()
//    }
//}
