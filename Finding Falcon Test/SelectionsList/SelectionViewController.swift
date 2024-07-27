//
//  SelectionViewController.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 26/07/24.
//

import UIKit

class SelectionViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionHeader: UILabel!
    lazy var collectionViewFlowLayout : SelectionCustomCVFlowLayout = {
        let layout = SelectionCustomCVFlowLayout(display: .list)
        return layout
    }()
    
    var planetDataSource: GenericDataSource<Planet>!
    var vehicleDataSource: GenericDataSource<Vehicle>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        self.collectionView.delegate = self
        collectionView.register(UINib(nibName: "SelectionCVCell", bundle: nil), forCellWithReuseIdentifier: "SelectionCVCell")

        planetDataSource = GenericDataSource(items: planets)
        vehicleDataSource = GenericDataSource(items: vehicles)

        collectionView.dataSource = planetDataSource
    }
    
    @IBAction func SelectSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.collectionHeader.text = "Select Planet".uppercased()
            collectionView.dataSource = planetDataSource
        } else {
            self.collectionHeader.text = "Select Vehicle".uppercased()
            collectionView.dataSource = vehicleDataSource
        }
        collectionView.reloadData()
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
//        print("Selected data\(dataSource)")
    }
}
