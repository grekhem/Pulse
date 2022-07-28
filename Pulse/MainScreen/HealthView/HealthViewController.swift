//
//  HealthViewController.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class HealthViewController: UIViewController {
    
    private let customView = HealthView()
    private let presenter: IHealthPresenter

    
    init(presenter: IHealthPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad(ui: customView)
    }
}
