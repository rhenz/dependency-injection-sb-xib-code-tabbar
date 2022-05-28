//
//  RootViewController.swift
//  Dependency Injection
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: -
    
    private let notes: [Note]
    
    // MARK: - Init
    init(with notes: [Note]) {
        // Set Notes
        self.notes = notes
        
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You should not instantiate this view controller by invoking init(coder:).")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register XIB for Cell Reuse Identifier
        let xib = UINib(nibName: NoteTableViewCell.reuseIdentifier, bundle: Bundle.main)
        tableView.register(xib, forCellReuseIdentifier: NoteTableViewCell.reuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Deselect Row
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

// MARK: - Table View Data Source
extension RootViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.reuseIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("Unable to Dequeue Note Table View Cell")
        }
        
        // Fetch Note
        let note = notes[indexPath.row]
        
        // Configure Cell
        cell.titleLabel.text = note.title
        
        return cell
    }
    
}

// MARK: - Table View Delegate
extension RootViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Fetch Note
        let note = notes[indexPath.row]
        
        // Initialize
        let detailViewController = DetailViewController(with: note)
        
        // Present Detail View Controller
        present(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
}
