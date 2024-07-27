//
//  SelectionDataSource.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 27/07/24.
//

import Foundation
import UIKit

var planets: [Planet] = [
    Planet(name: "Donlon", distance: 100, imageName: "Donlon"),
    Planet(name: "Enchai", distance: 200, imageName: "Enchai"),
    Planet(name: "Jebing", distance: 300, imageName: "Jebing"),
    Planet(name: "Sapir", distance: 400, imageName: "Sapir"),
    Planet(name: "Lerbin", distance: 500, imageName: "Lerbin"),
    Planet(name: "Pingasor", distance: 600,imageName: "Pingasor")]

var vehicles: [Vehicle] = [
    Vehicle(name: "Space Pod", totalAvailable: 2, maxDistance: 200, maxSpeed: 2, imageName: "Donlon"),
    Vehicle(name: "Space Rocket", totalAvailable: 1, maxDistance: 300, maxSpeed: 4, imageName: "Donlon"),
    Vehicle(name: "Space shuttle", totalAvailable: 1, maxDistance: 400, maxSpeed: 5, imageName: "Donlon"),
    Vehicle(name: "Space ship", totalAvailable: 2, maxDistance: 600, maxSpeed: 10, imageName: "Donlon")]

var isPlanetSelected = true

protocol Displayable {
    var name: String { get }
    var imageName: String { get }
}

struct Planet: Displayable {
    let name: String
    let distance: Int
    let imageName: String
}

struct Vehicle: Displayable {
    let name: String
    let totalAvailable: Int
    let maxDistance: Int
    let maxSpeed: Int
    let imageName: String
}

//class GenericDataSource<T> : NSObject {
//    var data: DynamicValue<[T]> = DynamicValue([])
//}
//
//class SelectionDataSource : GenericDataSource<NSObject>, UICollectionViewDataSource {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        print(data.value.count)
//        return data.value.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCVCell", for: indexPath) as! SelectionCVCell
//
//        return cell
//    }
//}

class GenericDataSource<T: Displayable>: NSObject, UICollectionViewDataSource {
    private var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    func updateItems(_ newItems: [T]) {
        self.items = newItems
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCVCell", for: indexPath) as! SelectionCVCell
        let item = items[indexPath.item]
        
        if let planet = item as? Planet {
            cell.configureForPlanet(with: planet)
        } else if let vehicle = item as? Vehicle {
            cell.configureForVehicle(with: vehicle)
        }
        
        return cell
    }
}
