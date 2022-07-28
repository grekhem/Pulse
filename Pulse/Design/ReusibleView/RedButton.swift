//
//  ContinueButton.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

final class RedButton: UIView {
    private var onTapHandler: (() -> Void)?
    private lazy var onTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = AppFont.sfProBold17.font
        label.textAlignment = .center
        return label
    }()
    
    init(label: String, onTapHandler: (() -> Void)?) {
        self.label.text = label
        self.onTapHandler = onTapHandler
        super.init(frame: .zero)
        configUI()
        self.addGestureRecognizer(onTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.backgroundColor = Color.red.color
        self.layer.cornerRadius = 18
        self.addSubview(label)
        self.label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        self.snp.makeConstraints { make in
            make.height.equalTo(52*DisplayScale.height)
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.onTapHandler?()
    }
}
