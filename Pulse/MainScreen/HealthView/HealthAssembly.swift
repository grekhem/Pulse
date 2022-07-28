//
//  HealthAssembly.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

enum HealthAssembly {
    static func makeModule() -> UIViewController {
        let presenter = HealthPresenter()
        let vc = HealthViewController(presenter: presenter)
        return vc
    }
}
