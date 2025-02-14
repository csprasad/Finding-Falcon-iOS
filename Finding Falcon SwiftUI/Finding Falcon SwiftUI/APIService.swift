//
//  APIService.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 14/02/25.
//

import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    // MARK: - Fetch Planets
    func fetchPlanets(completion: @escaping ([Planet]?) -> Void) {
        guard let url = URL(string: "https://findfalcone.geektrust.com/planets") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                let planets = try? JSONDecoder().decode([Planet].self, from: data)
                completion(planets)
            } else {
                completion(nil)
            }
        }.resume()
    }

    // MARK: - Fetch Vehicles
    func fetchVehicles(completion: @escaping ([Vehicle]?) -> Void) {
        guard let url = URL(string: "https://findfalcone.geektrust.com/vehicles") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                let vehicles = try? JSONDecoder().decode([Vehicle].self, from: data)
                completion(vehicles)
                print(vehicles as Any)
            } else {
                completion(nil)
            }
        }.resume()
    }

    // MARK: - Get Token
    func getToken(completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://findfalcone.geektrust.com/token") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data, error == nil {
                if let tokenResponse = try? JSONDecoder().decode([String: String].self, from: data) {
                    completion(tokenResponse["token"])
                }
            } else {
                completion(nil)
            }
        }.resume()
    }

    // MARK: - Find Falcone
    func findFalcone(token: String, planets: [String], vehicles: [String], completion: @escaping (FindFalconeResponse?) -> Void) {
        guard let url = URL(string: "https://findfalcone.geektrust.com/find") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let body: [String: Any] = [
            "token": token,
            "planet_names": planets,
            "vehicle_names": vehicles
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data, error == nil {
                let response = try? JSONDecoder().decode(FindFalconeResponse.self, from: data)
                completion(response)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
