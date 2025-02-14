//
//  Models.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import Foundation

// MARK: - Planet Model
struct Planet: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let distance: Int
}

// MARK: - Vehicle Model
struct Vehicle: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let totalNo: Int
    let maxDistance: Int
    let speed: Int

    enum CodingKeys: String, CodingKey {
        case name, totalNo = "total_no", maxDistance = "max_distance", speed
    }
}

// MARK: - Find Falcone Response Model
struct FindFalconeResponse: Codable, Equatable {
    let planetName: String?
    let status: String

    enum CodingKeys: String, CodingKey {
        case planetName = "planet_name", status
    }
}
