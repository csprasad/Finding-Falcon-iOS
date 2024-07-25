//
//  ViewController.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 25/07/24.
//

import UIKit

class ViewController: UITableViewController {
    
    private var desti: [Destination] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBSegueAction func makeCompositionalLayoutViewControllerWithHeaders(_ coder: NSCoder) -> DestinationCVController? {
        let compositionalLayout: UICollectionViewCompositionalLayout = {
            let fraction: CGFloat = 1 / 3
            let inset: CGFloat = 2.5
            
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
            
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
            
            // Supplementary Item
            let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
            let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: "header", alignment: .top)
            section.boundarySupplementaryItems = [headerItem]
            
            return UICollectionViewCompositionalLayout(section: section)
        }()
        
        let ds = [
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster"),
            Destination(id: 1, image: UIImage(systemName: "folder.fill") ?? UIImage(), vehicle: "Dust", planet: "Duster")
                  ]
        
        let dataSource = DestinationDataSource(destination: ds, sectionStyle: .byGroup(maximumItemsPerAlbum: 2, maximumNumberOfAlbums: 2))
        return DestinationCVController(collectionViewLayout: compositionalLayout, dataSource: dataSource, coder: coder)
    }
    
}

