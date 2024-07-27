//
//  SelectionCVCell.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 27/07/24.
//

import UIKit

class SelectionCVCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTotalNo: UILabel!
    @IBOutlet weak var labelMaxDistance: UILabel!
    @IBOutlet weak var labelSpeed: UILabel!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var totalNo: UILabel!
    @IBOutlet weak var maxDistance: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // use
    }
    
    func configureForVehicle(with data: Vehicle) {
        bgImage.image = UIImage(named: data.name)
        name.text = data.name
        totalNo.text = "\(data.totalAvailable)"
        maxDistance.text =  "\(data.maxDistance )"
        speed.text = "\(data.maxSpeed)"
        ViewSetup(isDisbaled: false)
    }
    
    func configureForPlanet(with data: Planet) {
        bgImage.image = UIImage(named: data.name)
        name.text = data.name
        totalNo.text = "\(data.distance)"
        ViewSetup(isDisbaled: true)
    }
    
    func ViewSetup(isDisbaled: Bool) {
        if isDisbaled {
            labelMaxDistance.isHidden = true
            labelSpeed.isHidden = true
            maxDistance.isHidden = true
            speed.isHidden = true
        } else {
            labelMaxDistance.isHidden = false
            labelSpeed.isHidden = false
            maxDistance.isHidden = false
            speed.isHidden = false
        }
    }

}
