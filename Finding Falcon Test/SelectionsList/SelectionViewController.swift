//
//  SelectionViewController.swift
//  Finding Falcon Test
//
//  Created by CS Prasad on 26/07/24.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewFlowLayout : SelectionCustomCVFlowLayout = {
        let layout = SelectionCustomCVFlowLayout(display: .grid)
        return layout
    }()
    
    let dataSource = SelectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.collectionViewLayout = self.collectionViewFlowLayout
        self.collectionView.dataSource = self.dataSource
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.collectionView.reloadData()
        }
        
        self.dataSource.data.value = [.red, .orange, .cyan, .purple, .yellow, .magenta]
    }
    
    @IBAction func SelectSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.collectionViewFlowLayout.display = .list
        case 2:
            self.collectionViewFlowLayout.display = .inline
        default:
            self.collectionViewFlowLayout.display = .grid
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        print("Selected data\(dataSource)")
    }
}
