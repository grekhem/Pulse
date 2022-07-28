//
//  GenderButtonView.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

final class GenderButtonView: UIView {
    private var onTapHandler: ((String) -> Void)?
    private lazy var onTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "smile")
        return image
    }()
    let title: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProMedium17.font
        label.textColor = Color.black.color
        return label
    }()
    
    init(title: String, onTapHandler: ((String) -> Void)?) {
        self.title.text = title
        self.onTapHandler = onTapHandler
        super.init(frame: .zero)
        self.configUI()
        self.addGestureRecognizer(onTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pressed() {
        self.backgroundColor = Color.red.color
        self.title.textColor = .white
    }
    
    func notPressed() {
        self.backgroundColor = Color.light.color
        self.title.textColor = Color.black.color
    }
    
}

private extension GenderButtonView {
    func configUI() {
        self.backgroundColor = Color.light.color
        self.layer.borderWidth = 1
        self.layer.borderColor = Color.gray.color.cgColor
        self.layer.cornerRadius = 18
        self.configTitle()
        self.configImage()
    }
    func configTitle() {
        self.addSubview(title)
        self.title.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Constraint.genderTextHorizontal)
        }
    }
    func configImage() {
        self.addSubview(image)
        self.image.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.trailing.equalToSuperview().inset(Constraint.genderTextHorizontal)
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let text = self.title.text else { return }
        self.onTapHandler?(text)
    }
}
