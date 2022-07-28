//
//  AlertView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class AlertView: UIView {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hand")
        return view
    }()
    let label: UILabel = {
        let lable = UILabel()
        lable.text = "Press with your finger to cover both the back camera and the flashlight"
        lable.textAlignment = .left
        lable.font = AppFont.sfProMedium15.font
        lable.textColor = .black
        lable.lineBreakMode = .byWordWrapping
        lable.numberOfLines = 2
        return lable
    }()
    
    init() {
        super.init(frame: .zero)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(imageView)
        self.imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
        self.addSubview(label)
        self.label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(17*DisplayScale.width)
            make.trailing.equalToSuperview().offset(-16*DisplayScale.width)
        }
    }
}
