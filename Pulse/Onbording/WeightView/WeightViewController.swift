//
//  WeightViewController.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

final class WeightViewController: UIViewController {
    
    private let customView = WeightView()
    private let presenter: IWeightPresenter
    
    init(presenter: IWeightPresenter) {
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
        self.presenter.onTapBackButton = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true, completion: nil)
        }
        
    }

}
