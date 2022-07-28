//
//  NumberCell.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

final class NumberCell: UIView {
    let label: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProHeavy47.font
        label.textColor = Color.black.color
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNumber(text: String) {
        self.label.text = text
    }
    
    private func configUI() {
        self.backgroundColor = Color.light.color
        self.layer.borderColor = Color.gray.color.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.snp.makeConstraints { make in
            make.height.equalTo(80*DisplayScale.height)
            make.width.equalTo(70*DisplayScale.width)
        }
        self.addSubview(label)
        self.label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
