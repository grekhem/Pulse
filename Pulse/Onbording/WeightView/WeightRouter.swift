//
//  WeightRouter.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

protocol IWeightRouter: AnyObject {
    func nextStep()
}

final class WeightRouter {
    weak var vc: UIViewController?
}

extension WeightRouter: IWeightRouter {
    func nextStep() {
        let nextVc = NotificationAssembly.makeModule()
        nextVc.modalTransitionStyle = .flipHorizontal
        nextVc.modalPresentationStyle = .fullScreen
        vc?.present(nextVc, animated: true, completion: nil)
    }
}
