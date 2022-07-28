//
//  WeightAssembly.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

enum WeightAssembly {
    static func makeModule() -> UIViewController {
        let router = WeightRouter()
        let presenter = WeightPresenter(router: router)
        let vc = WeightViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
