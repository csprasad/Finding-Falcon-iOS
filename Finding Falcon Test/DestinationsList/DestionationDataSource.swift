//
//  DestionationDataSource.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 25/07/24.
//

import UIKit


class DestinationDataSource: NSObject {
    
    struct Section {
        struct Item {
            let identifier: Int
            let image: UIImage
            let vehicle: String
            let planet: String
        }
        
        let items: [Item]
    }
    
    let sections: [Section]
    
    enum SectionStyle {
        
        case single
        
        case byGroup(maximumItemsPerAlbum: Int?, maximumNumberOfAlbums: Int?)
    }
    
    init(destination: [Destination], sectionStyle: SectionStyle) {
        switch sectionStyle {
        case .single:
            self.sections = [Section(items: destination.map{
                Section.Item(identifier: $0.id, image: $0.image, vehicle: $0.vehicle, planet: $0.planet)
            })]
            
        case .byGroup(let maximumItemsPerAlbum, let maximumNumberOfAlbums):
            var sectionNumberToItems: [Int: [Section.Item]] = [:]
            
            for item in destination {
                let item = Section.Item(identifier: item.id, image: item.image, vehicle: item.vehicle, planet: item.planet)
                
                if let existingItems = sectionNumberToItems[item.identifier] {
                    sectionNumberToItems[item.identifier] = existingItems + [item]
                } else {
                    sectionNumberToItems[item.identifier] = [item]
                }
            }
            
            let sortedKeys = sectionNumberToItems.keys.sorted()
            
            var sections: [Section] = []
            for key in Array(sortedKeys.prefix(maximumNumberOfAlbums ?? sortedKeys.count)) {
                guard let items = sectionNumberToItems[key] else { continue }
                sections.append(Section(items: Array(items.prefix(maximumItemsPerAlbum ?? items.count))))
            }
            
            self.sections = sections
        }
        
                
        super.init()
    }
}

extension DestinationDataSource: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DestinationCell", for: indexPath) as? DestinationCell else {
             return UICollectionViewCell()
        }
        
        let destination = sections[indexPath.section].items[indexPath.item]
        cell.viewModel = DestinationCell.ViewModel(id: destination.identifier, image: destination.image, vehicle: destination.vehicle, planet: destination.planet)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case "header":
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as? HeaderSupplementaryView else {
                return HeaderSupplementaryView()
            }
            
            headerView.viewModel = HeaderSupplementaryView.ViewModel(title: "Section \(indexPath.section + 1)")
            return headerView
            
        case "new-banner":
            let bannerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NewBannerSupplementaryView", for: indexPath)
            bannerView.isHidden = indexPath.row % 5 != 0 // show on every 5th item
            return bannerView
            
        default:
            assertionFailure("Unexpected element kind: \(kind).")
            return UICollectionReusableView()
        }
    }
}
