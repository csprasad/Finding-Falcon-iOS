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
        return DestinationCVController()
    }
    
}
