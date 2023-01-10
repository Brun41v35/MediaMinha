//
//  SceneDelegate.swift
//  Media Minha
//
//  Created by Bruno Silva on 24/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Variables
    
    var window: UIWindow?
    
    // MARK: - functions
    
    private func setupUserNameViewController() -> UINavigationController {
        let factory = CalculateGradeFactory()
        let userNameView = UserNameView()
        let userNameViewController = UserNameViewController(userNameView: userNameView,
                                                            calculateGradeFactory: factory)
        userNameViewController.title = "Bem-Vindo"
        
        return UINavigationController(rootViewController: userNameViewController)
    }
    
    // MARK: - Life Cycle Scene
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = setupUserNameViewController()
        window?.makeKeyAndVisible()
    }
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

