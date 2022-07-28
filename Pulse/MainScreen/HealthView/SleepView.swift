//
//  MeasureView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class SleepView: UIView {
    let labelName: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProMedium17.font
        label.textColor = Color.darkGray.color
        return label
    }()
    let imageView = UIImageView()
    let labelTime: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProBold17.font
        label.textColor = Color.black.color
        return label
    }()
    
    init(name: String, image: String, time: String, color: UIColor) {
        super.init(frame: .zero)
        self.labelName.text = name
        self.imageView.image = UIImage(named: image)
        self.labelTime.text = time
        self.labelName.textColor = color
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 18
        self.addSubview(imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
        self.addSubview(labelName)
        self.labelName.snp.makeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY)
            make.leading.equalTo(imageView.snp.trailing).offset(8*DisplayScale.width)
        }
        self.addSubview(labelTime)
        self.labelTime.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
    }
}
