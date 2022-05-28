//
//  BlueViewController.swift
//  Dependency-Injection-With-TabBar
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class BlueViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var versionLabel: UILabel!
    
    // MARK: -
    
    var applicationManager: ApplicationManager?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup View
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        // Configure Version Label
        versionLabel.text = applicationManager?.versionAsString
    }

}
