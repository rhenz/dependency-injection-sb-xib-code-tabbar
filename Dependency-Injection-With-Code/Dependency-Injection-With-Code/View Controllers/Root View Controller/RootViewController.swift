//
//  RootViewController.swift
//  Dependency Injection
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Properties
    
    private var tableView: UITableView?
    
    // MARK: -
    
    var notes: [Note] = []
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        setupView()
    }
    
    // MARK: - Helper Methods
    
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        // Initialize Table View
        let tableView = UITableView(frame: view.bounds)
        
        
        // Configure Table View
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Register XIB for Cell Reuse Identifier
        let xib = UINib(nibName: NoteTableViewCell.reuseIdentifier, bundle: Bundle.main)
        tableView.register(xib, forCellReuseIdentifier: NoteTableViewCell.reuseIdentifier)
        
        // Add as subview
        view.addSubview(tableView)
        
        // Set Table View
        self.tableView = tableView
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
        let detailViewController = DetailViewController()
        
        // Configure Detail View Controller
        detailViewController.note = note
        
        // Present Detail View Controller
        present(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
}
