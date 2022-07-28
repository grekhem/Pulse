//
//  HealthPresenter.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation

protocol IHealthPresenter: AnyObject {
    func viewDidLoad(ui: IHealthView)
}

final class HealthPresenter {
    weak var ui: IHealthView?
    
}

extension HealthPresenter: IHealthPresenter {
    
    func viewDidLoad(ui: IHealthView) {
        self.ui = ui
    }
    
}
