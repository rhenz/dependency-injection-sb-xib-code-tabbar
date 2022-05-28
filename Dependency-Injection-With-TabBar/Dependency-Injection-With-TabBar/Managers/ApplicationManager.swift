//
//  ApplicationManagerManager.swift
//  Dependency-Injection-With-TabBar
//
//  Created by John Salvador on 5/28/22.
//

import Foundation

class ApplicationManager {

    var versionAsString: String {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            return "-"
        }
        
        return infoDictionary["CFBundleShortVersionString"] as? String ?? "-"
    }
    
}
