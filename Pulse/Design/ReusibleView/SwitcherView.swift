//
//  SwitcherView.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

final class SwitcherView: UIView {
    private var isCM = true
    private var onTapHandler: (() -> Void)?
    private lazy var onTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    var firstLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProBold15.font
        label.textColor = .white
        label.textAlignment = .center
        label.layer.backgroundColor = Color.black.color.cgColor
        label.layer.cornerRadius = 14
        label.clipsToBounds = true
        return label
    }()
    var secondLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProBold15.font
        label.textColor = Color.textGray.color
        label.textAlignment = .center
        label.layer.backgroundColor = Color.light.color.cgColor
        label.layer.cornerRadius = 14
        label.clipsToBounds = true
        return label
    }()
    
    init(first: String, second: String, onTapHandler: (() -> Void)?) {
        self.onTapHandler = onTapHandler
        super.init(frame: .zero)
        self.firstLabel.text = first
        self.secondLabel.text = second
        self.configUI()
        self.addGestureRecognizer(onTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension SwitcherView {
    func configUI() {
        self.backgroundColor = Color.light.color
        self.layer.cornerRadius = 14
        self.configFirst()
        self.configSecond()
    }
    func configFirst() {
        self.addSubview(firstLabel)
        self.firstLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(2)
            make.height.equalTo(Constraint.switcherLabelHeight)
            make.width.equalTo(Constraint.switcherLabelWidth)
        }
    }
    func configSecond() {
        self.addSubview(secondLabel)
        self.secondLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(2)
            make.leading.equalTo(firstLabel.snp.trailing).offset(2)
            make.height.equalTo(Constraint.switcherLabelHeight)
            make.width.equalTo(Constraint.switcherLabelWidth)
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if isCM == true {
            isCM.toggle()
            firstLabel.textColor = Color.textGray.color
            firstLabel.backgroundColor = Color.light.color
            secondLabel.textColor = .white
            secondLabel.backgroundColor = Color.black.color
        } else {
            isCM.toggle()
            firstLabel.textColor = .white
            firstLabel.backgroundColor = Color.black.color
            secondLabel.textColor = Color.textGray.color
            secondLabel.backgroundColor = Color.light.color
        }
        self.onTapHandler?()
    }
}
