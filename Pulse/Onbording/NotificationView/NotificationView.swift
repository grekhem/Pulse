//
//  NotificationView.swift
//  Pulse
//
//  Created by Grekhem on 27.07.2022.
//

import Foundation
import UIKit

protocol INotificationView: AnyObject {
    var pressedBackButton: (() -> Void)? { get set }
    var pressedSkipButton: (() -> Void)? { get set }
}

final class NotificationView: UIView {
    var pressedBackButton: (() -> Void)?
    var pressedSkipButton: (() -> Void)?
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
        return button
    }()
    let logoImageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "logo")
        view.layer.shadowColor = Color.black.color.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 5)
        view.layer.shadowOpacity = 0.05
        view.image = image
        return view
    }()
    let notificationImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "notification")
        return view
    }()
    let stepLabel: UILabel = {
        let label = UILabel()
        let title = "Step 8 of 9"
        label.font = AppFont.sfProBold15.font
        label.textColor = Color.darkGray.color
        let attributedString = NSMutableAttributedString(string: title, attributes: nil)
        let stepRange = (attributedString.string as NSString).range(of: "Step 1")
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Color.black.color], range: stepRange)
        label.attributedText = attributedString
        return label
    }()
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(Color.red.color, for: .normal)
        button.titleLabel?.font = AppFont.sfProBold15.font
        button.addTarget(self, action: #selector(onSkipButton), for: .touchUpInside)
        return button
    }()
    let importantLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t miss anything important"
        label.font = AppFont.sfProBold24.font
        label.textColor = Color.black.color
        return label
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Allow notification to get daily health insights control your stress level, and stay strong and vigorous"
        label.font = AppFont.sfProRegular17.font
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    let allowButton = RedButton(label: "ALLOW NOTIFICATION") {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension NotificationView {
    func configUI() {
        self.backgroundColor = .white
        self.configStepLabel()
        self.configBackButton()
        self.configSkipButton()
        self.configLogo()
        self.configNotification()
        self.configImportantLabel()
        self.configTextView()
        self.configAllowButton()
    }
    func configStepLabel() {
        self.addSubview(stepLabel)
        self.stepLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constraint.stepTop)
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
    func configSkipButton() {
        self.addSubview(skipButton)
        self.skipButton.snp.makeConstraints { make in
            make.centerY.equalTo(stepLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16*DisplayScale.width)
        }
    }
    func configLogo() {
        self.addSubview(logoImageView)
        self.logoImageView.snp.makeConstraints { make in
            make.top.equalTo(stepLabel.snp.bottom).offset(191*DisplayScale.height)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(77*DisplayScale.width)
        }
    }
    func configNotification() {
        self.addSubview(notificationImageView)
        self.notificationImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.top).offset(-7)
            make.trailing.equalTo(logoImageView.snp.trailing).offset(7)
        }
    }
    func configImportantLabel() {
        self.addSubview(importantLabel)
        self.importantLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(31*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(23*DisplayScale.width)
        }
    }
    func configTextView() {
        self.addSubview(textLabel)
        self.textLabel.snp.makeConstraints { make in
            make.top.equalTo(importantLabel.snp.bottom).offset(10*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(16*DisplayScale.width)
        }
    }
    func configAllowButton() {
        self.addSubview(allowButton)
        self.allowButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(16*DisplayScale.width)
        }
    }
    @objc func onBackButton() {
        self.pressedBackButton?()
    }
    @objc func onSkipButton() {
        self.pressedSkipButton?()
    }
}

extension NotificationView: INotificationView {
    
}
