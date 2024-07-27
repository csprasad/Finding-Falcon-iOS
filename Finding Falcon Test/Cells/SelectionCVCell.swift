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
        bgImage.image = UIImage(named: "Donlon")
        print("into cell")
    }
    
    func configure(with data: Vehicle) {
        print("into cell config\(data)")
        name.text = data.name
        totalNo.text = "\(data.totalNo)"
        maxDistance.text =  "\(data.maxDistance )"
        speed.text = "\(data.speed)"
        
    }

}
