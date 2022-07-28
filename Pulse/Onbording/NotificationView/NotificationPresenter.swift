//
//  NotificationPresenter.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation

protocol INotificationPresenter: AnyObject {
    func viewDidLoad(ui: INotificationView)
    var onTapBackButton: (() -> Void)? { get set }
}

final class NotificationPresenter {
    weak var ui: INotificationView?
    var onTapBackButton: (() -> Void)?
    private var router: INotificationRouter
    
    init(router: INotificationRouter) {
        self.router = router
    }
}

extension NotificationPresenter: INotificationPresenter {
    
    func viewDidLoad(ui: INotificationView) {
        self.ui = ui
        self.ui?.pressedBackButton = { [weak self] in
            self?.onTapBackButton?()
        }
        self.ui?.pressedSkipButton = { [weak self] in
            self?.router.nextStep()
        }
    }
    
}
