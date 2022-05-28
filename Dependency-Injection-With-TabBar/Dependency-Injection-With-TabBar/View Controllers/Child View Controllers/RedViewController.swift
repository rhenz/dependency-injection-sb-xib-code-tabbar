//
//  RedViewController.swift
//  Dependency-Injection-With-TabBar
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class RedViewController: UIViewController {

    // MARK: - Properties
    
    var color: UIColor = .white
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = color
    }
    
}
