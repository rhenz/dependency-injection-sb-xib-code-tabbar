//
//  DetailViewController.swift
//  Dependency Injection
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    
    // MARK: -
    
    var note: Note?
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()

        // Configure Labels
        titleLabel.text = note?.title
        contentsLabel.text = note?.contents
    }
    
    // MARK: - Helper Methods
    private func setupView() {
        view.backgroundColor = .white
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        let margins = view.layoutMarginsGuide
        let safeArea = view.safeAreaLayoutGuide
        
        // Initialize Title Label
        let titleLabel = UILabel()
        
        // Configure Title Label
        view.addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeArea.topAnchor, multiplier: 1)
        ])
        
        // Initialize Contents Label
        let contentsLabel = UILabel(frame: .zero)
        
        // Configure Contents Label
        view.addSubview(contentsLabel)
        contentsLabel.numberOfLines = 0
        contentsLabel.textAlignment = .center
        contentsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        contentsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            contentsLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            contentsLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])

        // Configure Labels
        titleLabel.text = note?.title
        contentsLabel.text = note?.contents
        
        // Set Labels
        self.titleLabel = titleLabel
        self.contentsLabel = contentsLabel

        // Initialize Done Button
        let doneButton = UIButton(frame: .zero)
        
        // Configure Done Button
        view.addSubview(doneButton)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.addTarget(self, action: #selector(done(_:)), for: .touchUpInside)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.topAnchor.constraint(equalTo: contentsLabel.bottomAnchor)
        ])
    }

    // MARK: - Actions
    
    @IBAction func done(_ sender: Any) {
        // Dismiss View Controller
        dismiss(animated: true)
    }
    
}
