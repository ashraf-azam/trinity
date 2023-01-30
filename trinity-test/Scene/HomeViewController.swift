//
//  HomeViewController.swift
//  trinity-test
//
//  Created by Snappy on 30/01/2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, Storyboarded {
    
    private let homeCellIdentifier: String = "HomeTableViewCell"
    
    weak var coordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }
    
}
