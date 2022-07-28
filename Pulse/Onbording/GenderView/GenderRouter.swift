//
//  GenderRouter.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

protocol IGenderRouter: AnyObject {
    func nextStep()
}

final class GenderRouter {
    weak var vc: UIViewController?
}

extension GenderRouter: IGenderRouter {
    func nextStep() {
        let nextVc = HeightAssembly.makeModule()
        nextVc.modalTransitionStyle = .flipHorizontal
        nextVc.modalPresentationStyle = .fullScreen
        vc?.present(nextVc, animated: true, completion: nil)
    }
}
