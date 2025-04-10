//
//  SceneDelegate.swift
//  Сryptocurrency
//
//  Created by Malik Timurkaev on 09.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        if AuthService.shared.isAuthenticated {
            window.rootViewController = TabBarController()
        } else {
            let authService = AuthService.shared
            let viewModel = AuthViewModel(authService: authService)
            window.rootViewController = AuthViewController(viewModel: viewModel)
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

