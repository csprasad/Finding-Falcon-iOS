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
    @IBOutlet weak var bgVehicleImage: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTotalNo: UILabel!
    @IBOutlet weak var labelMaxDistance: UILabel!
    @IBOutlet weak var labelSpeed: UILabel!
    
    @IBOutlet weak var maxDistanceView: UIView!
    
    @IBOutlet weak var speedView: UIView!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var totalNo: UILabel!
    @IBOutlet weak var maxDistance: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // use
    }
    
    func configureForVehicle(with data: Vehicle) {
        labelTotalNo.text = "Avail"
        bgVehicleImage.image = UIImage(named: data.imageName)
        bgImage.image = UIImage()
        name.text = data.name
        totalNo.text = "\(data.totalAvailable)"
        maxDistance.text =  "\(data.maxDistance)M miles"
        speed.text = "\(data.maxSpeed)M mi/hr"
        ViewSetup(isPlanetDisbaled: true)
    }
    
    func configureForPlanet(with data: Planet) {
        labelTotalNo.text = "Distance"
        bgImage.image = UIImage(named: data.imageName)
        name.text = data.name
        totalNo.text = "\(data.distance) Million miles"
        ViewSetup(isPlanetDisbaled: false)
    }
    
    func ViewSetup(isPlanetDisbaled: Bool) {
        if !isPlanetDisbaled {
            labelMaxDistance.isHidden = true
            labelSpeed.isHidden = true
            maxDistance.isHidden = true
            speed.isHidden = true
            maxDistanceView.isHidden = true
            speedView.isHidden = true
            bgVehicleImage.isHidden = true
        } else {
            labelMaxDistance.isHidden = false
            labelSpeed.isHidden = false
            maxDistance.isHidden = false
            speed.isHidden = false
            maxDistanceView.isHidden = false
            speedView.isHidden = false
            bgVehicleImage.isHidden = false
        }
    }

}
