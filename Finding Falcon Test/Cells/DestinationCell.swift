//
//  DestinationCell.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 25/07/24.
//

import Foundation
import UIKit

class DestinationCell: UICollectionViewCell {
    @IBOutlet weak var bottomBGView: UIView! {
        didSet {
            bottomBGView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var destinationImage: UIImageView!
    
    @IBOutlet weak var planet: UILabel!
    @IBOutlet weak var vehicle: UILabel!
    
    struct ViewModel {
        let id: Int
        let image: UIImage
        let vehicle: String
        let planet: String
    }
    
    var viewModel: ViewModel? {
        didSet {
            destinationImage.image = viewModel?.image
            vehicle.text = "Vehicle \(viewModel?.vehicle ?? "godi")"
            planet.text = "Planet \(viewModel?.planet ?? "gadi")"
        }
    }
    
    override func prepareForReuse() {
        
    }
    
}
