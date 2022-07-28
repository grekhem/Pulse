//
//  TabBarAssembly.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation

import UIKit

enum TabBarAssembly {
    static func buildTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        let healthController = HealthAssembly.makeModule()
        let profileController = ProfileViewController()
        
        
        tabBar.setViewControllers([healthController, profileController], animated: true)
        tabBar.tabBar.tintColor = Color.red.color
        tabBar.tabBar.backgroundColor = UIColor.white

        let healthControllerBarItem = UITabBarItem(title: "Health", image: UIImage(named: "health"), tag: 1)
        healthControllerBarItem.setTitleTextAttributes([.font: AppFont.sfProBold12.font], for: .normal)
        healthController.tabBarItem = healthControllerBarItem
        

        let profileControllerBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 1)
        profileControllerBarItem.setTitleTextAttributes([.font: AppFont.sfProBold12.font], for: .normal)
        profileController.tabBarItem = profileControllerBarItem
        profileController.view.layer.backgroundColor = UIColor(white: 1, alpha: 1).cgColor

        return tabBar
    }
}
