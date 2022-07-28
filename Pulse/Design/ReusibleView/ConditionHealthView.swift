//
//  conditionHealthView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class ConditionHealthView: UIView {
    let imageView = UIImageView()
    
    init(image: String) {
        super.init(frame: .zero)
        self.imageView.image = UIImage(named: image)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.snp.makeConstraints { make in
            make.height.equalTo(66*DisplayScale.height)
            make.width.equalTo(111*DisplayScale.width)
        }
        self.addSubview(imageView)
        self.imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(44*DisplayScale.height)
            make.width.equalTo(89*DisplayScale.width)
        }
    }
}
