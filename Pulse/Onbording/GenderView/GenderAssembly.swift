//
//  GenderAssembly.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

enum GenderAssembly {
    static func makeModule() -> UIViewController {
        let router = GenderRouter()
        let presenter = GenderPresenter(router: router)
        let vc = GenderViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
