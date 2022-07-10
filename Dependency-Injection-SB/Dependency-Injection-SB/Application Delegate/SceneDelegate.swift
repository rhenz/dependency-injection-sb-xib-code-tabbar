//
//  SceneDelegate.swift
//  Dependency-Injection-SB
//
//  Created by John Salvador on 5/28/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // MARK: -
    private var notes: [Note] {
        return [
            Note(title: "Monday, January 11", contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac dolor justo, ac tempus leo. Etiam pulvinar eros at lectus sollicitudin scelerisque."),
            Note(title: "Another Day", contents: "Aliquam erat volutpat. Suspendisse eu eros non elit blandit suscipit. Morbi scelerisque euismod tempus. Vestibulum elementum tincidunt tempor. Mauris sodales tristique adipiscing."),
            Note(title: "Ideas", contents: "Sed venenatis lorem quis eros hendrerit consequat. Sed a est leo. Donec sapien libero, rutrum eget luctus ac, accumsan vel lectus. Ut quis libero ante. Ut volutpat, massa ac aliquam molestie, neque est blandit diam, non adipiscing purus magna vitae massa."),
            Note(title: "Help", contents: "Vestibulum fermentum consectetur sem, non aliquet nisl varius porta. Nulla consectetur tellus vel nibh tincidunt nec tincidunt nunc pellentesque. Etiam vel arcu sit amet quam auctor tincidunt commodo eu leo. Aliquam in arcu nulla. Donec eget imperdiet dui. Praesent vitae odio leo. Morbi bibendum lobortis sapien sit amet posuere.")
        ]
    }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        // Initialize Root View Controller
        guard let navVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? UINavigationController else {
            fatalError("Unable to instantiate Root View Controller")
        }
        
        // Get initial VC from the Navigation Controller
        guard let rootVC = navVC.topViewController as? RootViewController else {
            fatalError("Root View Controller not found in navigation controller")
        }
        
        // Configure Root View Controller
        rootVC.notes = notes
        
        // Configure Window
        self.window?.rootViewController = navVC
        
        // Make Key And Visible
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

