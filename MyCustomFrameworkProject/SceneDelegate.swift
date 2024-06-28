//
//  SceneDelegate.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum ActionType: String {
        case searchAction     = "SearchAction"
        case shareAction      = "ShareAction"
        case favoriteAction   = "FavoriteAction"
        case addEmployeAction = "EmployeeAction"
    }

    var window: UIWindow?
    
    var savedShortCutItem: UIApplicationShortcutItem!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if let shortcutItem = connectionOptions.shortcutItem {
            savedShortCutItem = shortcutItem
        }
        guard let _ = (scene as? UIWindowScene) else { return }
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
        if savedShortCutItem != nil {
            _ = handleShortCutItem(shortcutItem: savedShortCutItem)
        }
    }
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handled)
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
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        if let actionTypeValue = ActionType(rawValue: shortcutItem.type) {
            
            switch actionTypeValue {
            case .searchAction:
                print("open home screen")
            case .shareAction:
                showAlert(message: "Share triggered")
            case .favoriteAction:
                showAlert(message: "Favorite triggered")
            case .addEmployeAction:
                self.navigateToAddEmpVC()
            }
        }
        return true
    }
    
    func navigateToAddEmpVC() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddEmployeeViewController") as! AddEmployeeViewController
        let navVC = self.window?.rootViewController as? UINavigationController
        navVC?.pushViewController(vc, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Quick Action", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }


}

