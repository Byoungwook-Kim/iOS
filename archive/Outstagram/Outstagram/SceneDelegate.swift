//
//  SceneDelegate.swift
//  Outstagram
//
//  Created by Byoung_wook on 2022/01/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarConTroller()
        window?.tintColor = .label
        window?.makeKeyAndVisible()
    }


}
