//
//  HeightAssembly.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

enum HeightAssembly {
    static func makeModule() -> UIViewController {
        let router = HeightRouter()
        let presenter = HeightPresenter(router: router)
        let vc = HeightViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
