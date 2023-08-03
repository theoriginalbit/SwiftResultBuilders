//
//  SceneDelegate.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        window.rootViewController = rootViewController()
        self.window = window
        window.makeKeyAndVisible()
    }

    private func rootViewController() -> UIViewController {
        return settingsViewController()
    }

    private func settingsViewController() -> UIViewController {
        let controller = SettingsViewController()
        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
