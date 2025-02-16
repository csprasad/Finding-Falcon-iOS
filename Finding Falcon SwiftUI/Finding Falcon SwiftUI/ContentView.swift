//
//  ContentView.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FindingFalconeViewModel()
    @State private var navigateToResult = false
    @State private var result: FindFalconeResponse?

    var body: some View {
        
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else {
                    ForEach(0..<4, id: \.self) { index in
                        PlanetSelectionView(viewModel: viewModel, index: index)
                    }
                    
                    Button("Find Falcone") {
                        viewModel.findFalcone()
                    }
                    .padding()
                    .disabled(viewModel.isFinding)
                    .onChange(of: viewModel.result) { newResult in
                        if let newResult = newResult {
                            result = newResult
                            navigateToResult = true
                        }
                    }
                }
            }
            .navigationTitle("Finding Falcone")
            .background(
                NavigationLink(
                    destination: result.map { ResultView(result: $0) },
                    isActive: $navigateToResult
                ) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
