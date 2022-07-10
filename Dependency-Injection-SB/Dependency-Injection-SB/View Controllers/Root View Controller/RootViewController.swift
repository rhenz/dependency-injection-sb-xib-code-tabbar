//
//  RootViewController.swift
//  Dependency-Injection-SB
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Types
    private enum Segue: String {
        case noteDetails = "NoteDetails"
        
        static func getIdentifier(_ identifier: String?) -> Segue? {
            if let identifier = identifier {
                return Segue(rawValue: identifier)
            }
            return nil
        }
    }
    
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: -
    
    var notes = [Note]()

    // MARK: - View Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Deselect Row
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        guard let identifier = Segue.getIdentifier(segue.identifier) else { return }
        
        switch identifier {
        case .noteDetails:
            guard let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("No Note Selected")
            }
            
            guard let destination = segue.destination as? DetailViewController else {
                fatalError("Unexpected Destination View Controller")
            }
            
            /* PROPERTY INJECTION */
            // Fetch Note
            let note = notes[indexPath.item]
            
            // Configure Detail View Controller
            destination.note = note
        }
         */
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
        // Fetch note
        let note = notes[indexPath.item]
        showNoteDetailViewController(note: note)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

// MARK: - Helper Methods

extension RootViewController {
    private func showNoteDetailViewController(note: Note) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DetailViewController", creator: { coder in
            return DetailViewController(coder: coder, note: note)
        }) else {
            fatalError("Failed to load Detail View Controller for some reason \(#file) \(#function)")
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
