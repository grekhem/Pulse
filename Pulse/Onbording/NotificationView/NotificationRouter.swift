//
//  NotificationRouter.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

protocol INotificationRouter: AnyObject {
    func nextStep()
}

final class NotificationRouter {
    weak var vc: UIViewController?
}

extension NotificationRouter: INotificationRouter {
    func nextStep() {
        let nextVc = TabBarAssembly.buildTabBar()
        nextVc.modalTransitionStyle = .flipHorizontal
        nextVc.modalPresentationStyle = .fullScreen
        vc?.present(nextVc, animated: true, completion: nil)
    }
}
