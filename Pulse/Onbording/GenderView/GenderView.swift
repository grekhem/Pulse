//
//  GenderView.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit
import SnapKit

protocol IGenderView: AnyObject {
    var onTappedGender: ((String) -> Void)? { get set }
    func pressedMale()
    func pressedFemale()
    func pressedNonBinary()
}

final class GenderView: UIView {
    var onTappedGender: ((String) -> Void)?
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    let stepLabel: UILabel = {
        let label = UILabel()
        let title = "Step 1 of 9"
        label.font = AppFont.sfProBold15.font
        label.textColor = Color.darkGray.color
        let attributedString = NSMutableAttributedString(string: title, attributes: nil)
        let stepRange = (attributedString.string as NSString).range(of: "Step 1")
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Color.black.color], range: stepRange)
        label.attributedText = attributedString
        return label
    }()
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "What's your gender?"
        label.font = AppFont.sfProBold24.font
        label.textColor = Color.black.color
        return label
    }()
    lazy var maleButton = GenderButtonView(title: "Male") { [weak self] text in
        guard let self = self else { return }
        self.onTappedGender?(text)
    }
    lazy var femaleButton = GenderButtonView(title: "Female") { [weak self] text in
        guard let self = self else { return }
        self.onTappedGender?(text)
    }
    lazy var nonBinaryButton = GenderButtonView(title: "Non-binary") { [weak self] text in
        guard let self = self else { return }
        self.onTappedGender?(text)
    }
    
    init() {
        super.init(frame: .zero)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension GenderView {
    func configUI() {
        self.backgroundColor = .white
        self.configStepLabel()
        self.configGenderLabel()
        self.configBackButton()
        self.configMaleButton()
        self.configFemaleButton()
        self.configNonBinaryButton()
        
    }
    func configStepLabel() {
        self.addSubview(stepLabel)
        self.stepLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constraint.stepTop)
            make.leading.trailing.equalToSuperview().inset(Constraint.stepHorizontal)
        }
    }
    func configGenderLabel() {
        self.addSubview(genderLabel)
        self.genderLabel.snp.makeConstraints { make in
            make.top.equalTo(stepLabel.snp.bottom).offset(Constraint.qaLabelTop)
            make.centerX.equalToSuperview()
        }
    }
    func configBackButton() {
        self.addSubview(backButton)
        self.backButton.snp.makeConstraints { make in
            make.centerY.equalTo(stepLabel.snp.centerY)
            make.leading.equalToSuperview().offset(Constraint.backButtonLeading)
        }
    }
    func configMaleButton() {
        self.addSubview(maleButton)
        self.maleButton.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(Constraint.maleButtonTop)
            make.leading.trailing.equalToSuperview().inset(Constraint.genderButtonHorizontalInset)
            make.height.equalTo(Constraint.genderButtonHeight)
        }
    }
    func configFemaleButton() {
        self.addSubview(femaleButton)
        self.femaleButton.snp.makeConstraints { make in
            make.top.equalTo(maleButton.snp.bottom).offset(Constraint.betweenGenderButton)
            make.leading.trailing.equalToSuperview().inset(Constraint.genderButtonHorizontalInset)
            make.height.equalTo(Constraint.genderButtonHeight)
        }
    }
    func configNonBinaryButton() {
        self.addSubview(nonBinaryButton)
        self.nonBinaryButton.snp.makeConstraints { make in
            make.top.equalTo(femaleButton.snp.bottom).offset(Constraint.betweenGenderButton)
            make.leading.trailing.equalToSuperview().inset(Constraint.genderButtonHorizontalInset)
            make.height.equalTo(Constraint.genderButtonHeight)
        }
    }
}

extension GenderView: IGenderView {
    func pressedMale() {
        self.maleButton.pressed()
        self.femaleButton.notPressed()
        self.nonBinaryButton.notPressed()
    }
    func pressedFemale() {
        self.maleButton.notPressed()
        self.femaleButton.pressed()
        self.nonBinaryButton.notPressed()
    }
    func pressedNonBinary() {
        self.maleButton.notPressed()
        self.femaleButton.notPressed()
        self.nonBinaryButton.pressed()
    }
}
