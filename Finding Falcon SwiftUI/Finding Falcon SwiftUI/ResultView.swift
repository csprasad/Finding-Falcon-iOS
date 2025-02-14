//
//  ResultView.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import SwiftUI

struct ResultView: View {
    let result: FindFalconeResponse

    var body: some View {
        VStack {
            if result.status == "success" {
                Text("Success! Falcone found on \(result.planetName ?? "unknown planet").")
            } else {
                Text("Failed to find Falcone.")
            }
        }
        .padding()
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
