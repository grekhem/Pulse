//
//  SceneDelegate.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let vc = GenderAssembly.makeModule()
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }

}

