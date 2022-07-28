//
//  HeightRouter.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

protocol IHeightRouter: AnyObject {
    func nextStep()
}

final class HeightRouter {
    weak var vc: UIViewController?
}

extension HeightRouter: IHeightRouter {
    func nextStep() {
        let nextVc = WeightAssembly.makeModule()
        nextVc.modalTransitionStyle = .flipHorizontal
        nextVc.modalPresentationStyle = .fullScreen
        vc?.present(nextVc, animated: true, completion: nil)
    }
}
