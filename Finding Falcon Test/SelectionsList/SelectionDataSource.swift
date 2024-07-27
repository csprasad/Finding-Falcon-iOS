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
    Vehicle(name: "Space Pod", totalAvailable: 2, maxDistance: 200, maxSpeed: 2, imageName: "SpacePod"),
    Vehicle(name: "Space Rocket", totalAvailable: 1, maxDistance: 300, maxSpeed: 4, imageName: "SpaceRocket"),
    Vehicle(name: "Space shuttle", totalAvailable: 1, maxDistance: 400, maxSpeed: 5, imageName: "SpaceShuttle"),
    Vehicle(name: "Space ship", totalAvailable: 2, maxDistance: 600, maxSpeed: 10, imageName: "Spaceship")]

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
        configureProductCell(cell, for: indexPath)
        return cell
    }
    
    private let cellsShadowColor = UIColor(hex: "2a002a").cgColor
    private let gradientFirstColor = UIColor(hex: "EEEEEE")
    private let gradientSecondColor = UIColor(hex: "a81382").cgColor
    
    private func configureProductCell(_ cell: SelectionCVCell, for indexPath: IndexPath) {
//        cell.clipsToBounds = false
//        cell.backgroundColor = gradientFirstColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = cell.bounds
//        gradientLayer.colors = [gradientFirstColor, gradientSecondColor]
        cell.layer.cornerRadius = 8
        cell.bgView.layer.cornerRadius = 8
//        gradientLayer.masksToBounds = true
//        cell.layer.insertSublayer(gradientLayer, at: 0)
        
        cell.layer.shadowColor = cellsShadowColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 16
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 10)
        
        let item = items[indexPath.item]
        
        if let planet = item as? Planet {
            cell.configureForPlanet(with: planet)
        } else if let vehicle = item as? Vehicle {
            cell.configureForVehicle(with: vehicle)
        }
    }
}
