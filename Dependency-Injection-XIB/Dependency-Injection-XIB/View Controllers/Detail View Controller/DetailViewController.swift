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
    
    private let note: Note
    
    // MARK: - Init
    init(with note: Note) {
        // Set Note
        self.note = note
        
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You should not instantiate this view controller by invoking init(coder:).")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure Labels
        titleLabel.text = note.title
        contentsLabel.text = note.contents
    }

    // MARK: - Actions
    
    @IBAction func done(_ sender: Any) {
        // Dismiss View Controller
        dismiss(animated: true)
    }
    
}
