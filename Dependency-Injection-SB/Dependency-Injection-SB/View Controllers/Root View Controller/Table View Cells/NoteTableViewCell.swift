//
//  NoteTableViewCell.swift
//  Dependency-Injection-SB
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: - Type Properties
    
    static var reuseIdentifier: String { return String(describing: self) }

    // MARK: - Properties
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
