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
    
    let dataSource = SelectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self
//        collectionView.register(SelectionCVCell.self, forCellWithReuseIdentifier: "SelectionCVCell")
        collectionView.register(UINib(nibName: "SelectionCVCell", bundle: nil), forCellWithReuseIdentifier: "SelectionCVCell")


        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.collectionView.reloadData()
        }
        
        self.dataSource.data.value = [
            Vehicle(name: "Space Pod", totalNo: 2, maxDistance: 200, speed: 2, image: UIImage(named: "Donlon") ?? UIImage()),
            Vehicle(name: "Space Rocket", totalNo: 1, maxDistance: 300, speed: 4, image: UIImage(named: "Enchai") ?? UIImage())]
    }
    
    @IBAction func SelectSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.collectionViewFlowLayout.display = .list
            self.collectionHeader.text = "Select Planets".capitalized
        case 2:
            self.collectionViewFlowLayout.display = .list
            self.collectionHeader.text = "Select Vehicle".capitalized
        default:
            self.collectionViewFlowLayout.display = .grid
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        print("Selected data\(dataSource)")
    }
}
