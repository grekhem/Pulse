//
//  GenderPresenter.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

protocol IGenderPresenter: AnyObject {
    func viewDidLoad(ui: IGenderView)
}

final class GenderPresenter {
    weak var ui: IGenderView?
    private var router: IGenderRouter
    
    init(router: IGenderRouter) {
        self.router = router
    }
    
    func onTapGender(title: String) {
        switch title {
        case "Male":
            self.ui?.pressedMale()
            UserDefaults.standard.set("Male", forKey: "gender")
            self.router.nextStep()
        case "Female":
            self.ui?.pressedFemale()
            UserDefaults.standard.set("Female", forKey: "gender")
            self.router.nextStep()
        case "Non-binary":
            self.ui?.pressedNonBinary()
            UserDefaults.standard.set("Non-binary", forKey: "gender")
            self.router.nextStep()
        default:
            return
        }
    }
}

extension GenderPresenter: IGenderPresenter {
    func viewDidLoad(ui: IGenderView) {
        self.ui = ui
        self.ui?.onTappedGender = { [weak self] text in
            guard let self = self else { return }
            self.onTapGender(title: text)
        }
    }
    
}



