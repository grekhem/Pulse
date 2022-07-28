//
//  HeightPresenter.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation

protocol IHeightPresenter: AnyObject {
    func viewDidLoad(ui: IHeightView)
    var onTapBackButton: (() -> Void)? { get set }
}

final class HeightPresenter {
    weak var ui: IHeightView?
    var onTapBackButton: (() -> Void)?
    private var router: IHeightRouter
    
    init(router: IHeightRouter) {
        self.router = router
    }
}

extension HeightPresenter: IHeightPresenter {
    func viewDidLoad(ui: IHeightView) {
        self.ui = ui
        self.ui?.pressedBackButton = { [weak self] in
            self?.onTapBackButton?()
        }
        self.ui?.pressedContinueButton = { [weak self] isCM, height in
            UserDefaults.standard.set(isCM, forKey: "isCM")
            UserDefaults.standard.set(height, forKey: "height")
            self?.router.nextStep()
        }
    }
    
}
