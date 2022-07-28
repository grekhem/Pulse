//
//  MeasureView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class MeasureView: UIView {
    let labelName: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProRegular17.font
        label.textColor = Color.darkGray.color
        return label
    }()
    let imageView = UIImageView()
    let labelCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = AppFont.sfProBold26.font
        label.textColor = Color.black.color
        return label
    }()
    let labelBPM: UILabel = {
        let label = UILabel()
        label.text = "BPM"
        label.font = AppFont.sfProBold13.font
        label.textColor = Color.darkGray.color
        return label
    }()
    
    init(name: String) {
        super.init(frame: .zero)
        self.labelName.text = name
        self.imageView.image = UIImage(named: "icon")
        self.configUI()
    }
    
    func changeBPM(bpm: Int) {
        self.labelCount.text = "\(bpm)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 18
        self.addSubview(labelName)
        self.labelName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
        self.addSubview(imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(labelName.snp.bottom).offset(10*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
        self.addSubview(labelCount)
        self.labelCount.snp.makeConstraints { make in
            make.centerY.equalTo(imageView.snp.centerY)
            make.leading.equalTo(imageView.snp.trailing).offset(8*DisplayScale.width)
        }
        self.addSubview(labelBPM)
        self.labelBPM.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom)
            make.leading.equalTo(labelCount.snp.trailing).offset(4*DisplayScale.width)
        }
    }
}
