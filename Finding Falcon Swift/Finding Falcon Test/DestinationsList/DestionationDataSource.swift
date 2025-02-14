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
            let groupId: Int
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
        case byGroup(maximumItemsPerGroup: Int?, maximumNumberOfGroup: Int?)
    }
    
    init(destination: [Destination], sectionStyle: SectionStyle) {
        switch sectionStyle {
        case .single:
            self.sections = [Section(items: destination.map{
                Section.Item(groupId: $0.groupId, identifier: $0.id, image: $0.image, vehicle: $0.vehicle, planet: $0.planet)
            })]
            
        case .byGroup(let maximumItemsPerGroup, let maximumNumberOfGroup):
            var sectionNumberToItems: [Int: [Section.Item]] = [:]
            
            for item in destination {
                let item = Section.Item(groupId: item.groupId, identifier: item.id, image: item.image, vehicle: item.vehicle, planet: item.planet)
                
                if let existingItems = sectionNumberToItems[item.groupId] {
                    sectionNumberToItems[item.groupId] = existingItems + [item]
                } else {
                    sectionNumberToItems[item.groupId] = [item]
                }
            }
            
            let sortedKeys = sectionNumberToItems.keys.sorted()
            
            var sections: [Section] = []
            for key in Array(sortedKeys.prefix(maximumNumberOfGroup ?? sortedKeys.count)) {
                guard let items = sectionNumberToItems[key] else { continue }
                sections.append(Section(items: Array(items.prefix(maximumItemsPerGroup ?? items.count))))
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
            
            headerView.viewModel = HeaderSupplementaryView.ViewModel(title: "Select Destination") //\(indexPath.section + 1)
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


extension DestinationCVController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection
        print("Selected item at \(indexPath)")
        let vc = UIViewController(nibName: "Main", bundle: nil)
        if let nextVC = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as? SelectionViewController {
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }

}
