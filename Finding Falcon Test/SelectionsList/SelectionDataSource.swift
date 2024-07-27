//
//  SelectionDataSource.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 27/07/24.
//

import Foundation
import UIKit

struct Vehicle {
    let name: String
    let totalNo: Int
    let maxDistance: Double
    let speed: Int
    let image: UIImage
    
    init(name: String, totalNo: Int, maxDistance: Double, speed: Int, image: UIImage) {
        self.name = name
        self.totalNo = totalNo
        self.maxDistance = maxDistance
        self.speed = speed
        self.image = image
    }
}

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class SelectionDataSource : GenericDataSource<Vehicle>, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(data.value.count)
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCVCell", for: indexPath) as! SelectionCVCell
        print("vehicle Data: \(data.value[indexPath.row])")
        cell.configure(with: data.value[indexPath.row])
        return cell
    }
}
