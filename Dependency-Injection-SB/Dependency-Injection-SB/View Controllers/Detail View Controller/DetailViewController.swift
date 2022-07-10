//
//  DetailViewController.swift
//  Dependency-Injection-SB
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    
    // MARK: -
    
    var note: Note
    
    // MARK: - Init
    
    init?(coder: NSCoder, note: Note) {
        self.note = note
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a Note")
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
//        dismiss(animated: true)
        
//         Pop View Controller (if using Navigation Controller)
        navigationController?.popViewController(animated: true)
    }
}
