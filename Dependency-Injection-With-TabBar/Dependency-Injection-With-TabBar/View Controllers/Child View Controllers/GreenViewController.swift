//
//  GreenViewController.swift
//  Dependency-Injection-With-TabBar
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class GreenViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: -
    
    var viewModel: GreenViewModel?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View Model
        setupViewModel(with: viewModel)
    }
    
    // MARK: - Helper Methods
    
    private func setupViewModel(with viewModel: GreenViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        
        // Configure Title Label
        titleLabel.text = viewModel.title
    }
    
}
