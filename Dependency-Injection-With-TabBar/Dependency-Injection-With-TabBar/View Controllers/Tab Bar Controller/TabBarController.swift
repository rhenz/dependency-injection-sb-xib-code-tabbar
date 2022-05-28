//
//  TabBarController.swift
//  Dependency-Injection-With-TabBar
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    var applicationManager: ApplicationManager?

    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Child View Controllers
        setupChildViewControllers()
    }
    
    // MARK: - Helper Methods
    private func setupChildViewControllers() {
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            var childViewController: UIViewController?
            
            if let navigationController = viewController as? UINavigationController {
                childViewController = navigationController.viewControllers.first
            } else {
                childViewController = viewController
            }
            
            switch childViewController {
            case let vc as RedViewController:
                // Configure View Controller
                vc.title = "Red"
                vc.color = .red
            case let vc as GreenViewController:
                // Initialize View Model
                let viewModel = GreenViewModel(title: "Green")
                
                // Configure View Controller
                vc.title = "Green"
                vc.viewModel = viewModel
                
            case let vc as BlueViewController:
                // Configure View Controller
                vc.title = "Blue"
                vc.applicationManager = applicationManager
                
            default:
                break
            }
        }
    }
    
}
