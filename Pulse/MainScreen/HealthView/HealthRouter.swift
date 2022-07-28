//
//  HealthRouter.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

protocol IHealthRouter: AnyObject {
    func nextStep()
}

final class NotificationRouter {
    weak var vc: UIViewController?
}

extension NotificationRouter: INotificationRouter {
    func nextStep() {
        print("Next step")
//        let nextVc = WeightAssembly.makeModule()
//        nextVc.modalTransitionStyle = .flipHorizontal
//        nextVc.modalPresentationStyle = .fullScreen
//        vc?.present(nextVc, animated: true, completion: nil)
    }
}
