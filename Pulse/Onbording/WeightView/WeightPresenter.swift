//
//  WeightPresenter.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation

protocol IWeightPresenter: AnyObject {
    func viewDidLoad(ui: IWeightView)
    var onTapBackButton: (() -> Void)? { get set }
}

final class WeightPresenter {
    weak var ui: IWeightView?
    var onTapBackButton: (() -> Void)?
    private var router: IWeightRouter
    
    init(router: IWeightRouter) {
        self.router = router
    }
}

extension WeightPresenter: IWeightPresenter {
    func viewDidLoad(ui: IWeightView) {
        self.ui = ui
        self.ui?.pressedBackButton = { [weak self] in
            self?.onTapBackButton?()
        }
        self.ui?.pressedContinueButton = { [weak self] isKg, weight in
            UserDefaults.standard.set(isKg, forKey: "isKg")
            UserDefaults.standard.set(weight, forKey: "weight")
            self?.router.nextStep()
        }
    }
    
}
