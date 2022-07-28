//
//  NotificationAssembly.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

enum NotificationAssembly {
    static func makeModule() -> UIViewController {
        let router = NotificationRouter()
        let presenter = NotificationPresenter(router: router)
        let vc = NotificationViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
