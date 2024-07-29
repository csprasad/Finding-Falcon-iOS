//
//  SelectionViewController.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 26/07/24.
//

import UIKit

class SelectionViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    
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
        blurView.layer.cornerRadius = 16
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
        
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        self.collectionView.delegate = self
        collectionView.register(UINib(nibName: "SelectionCVCell", bundle: nil), forCellWithReuseIdentifier: "SelectionCVCell")

        planetDataSource = GenericDataSource(items: planets)
        vehicleDataSource = GenericDataSource(items: vehicles)

        collectionView.dataSource = planetDataSource
        let normalTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
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
        navigationController?.popViewController(animated: true)
    }
}
