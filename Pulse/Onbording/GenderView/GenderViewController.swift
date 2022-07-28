//
//  GenderViewController.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import UIKit

final class GenderViewController: UIViewController {
    
    private let customView = GenderView()
    private let presenter: IGenderPresenter
    
    init(presenter: IGenderPresenter) {
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
