//
//  HeighView.swift
//  Pulse
//
//  Created by Grekhem on 26.07.2022.
//

import Foundation
import UIKit

protocol IHeightView: AnyObject {
    var pressedBackButton: (() -> Void)? { get set }
    var pressedContinueButton: ((Bool, String) -> Void)? { get set }
}

final class HeightView: UIView, UITextFieldDelegate {
    var isCM = true
    var height = ""
    var pressedBackButton: (() -> Void)?
    var pressedContinueButton: ((Bool, String) -> Void)?
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(onBackButton), for: .touchUpInside)
        return button
    }()
    let stepLabel: UILabel = {
        let label = UILabel()
        let title = "Step 3 of 9"
        label.font = AppFont.sfProBold15.font
        label.textColor = Color.darkGray.color
        let attributedString = NSMutableAttributedString(string: title, attributes: nil)
        let stepRange = (attributedString.string as NSString).range(of: "Step 3")
        attributedString.setAttributes([NSAttributedString.Key.foregroundColor: Color.black.color], range: stepRange)
        label.attributedText = attributedString
        return label
    }()
    let HeightLabel: UILabel = {
        let label = UILabel()
        label.text = "What's your height?"
        label.font = AppFont.sfProBold24.font
        label.textColor = Color.black.color
        return label
    }()
    let textField: UITextField = {
        let textfield = UITextField()
        textfield.keyboardType = .phonePad
        textfield.tintColor = .clear
        textfield.textColor = UIColor(white: 230, alpha: 0)
        return textfield
    }()
    lazy var switcher = SwitcherView(first: "cm", second: "ft") {
        self.isCM.toggle()
        self.textField.text = ""
        for i in self.arrayView {
            i.removeFromSuperview()
        }
        self.configCells()
        self.configCursor()
    }
    let cell1 = NumberCell()
    let cell2 = NumberCell()
    let cell3 = NumberCell()
    let CMLabel: UILabel = {
        let label = UILabel()
        label.text = "cm"
        label.font = AppFont.sfProHeavy17.font
        label.textColor = Color.black.color
        return label
    }()
    let ftLabel: UILabel = {
        let label = UILabel()
        label.text = "ft"
        label.font = AppFont.sfProHeavy17.font
        label.textColor = Color.black.color
        return label
    }()
    let inLabel: UILabel = {
        let label = UILabel()
        label.text = "in"
        label.font = AppFont.sfProHeavy17.font
        label.textColor = Color.black.color
        return label
    }()
    let cursor: UIView = {
        let view = UIView()
        view.backgroundColor = Color.darkGray.color
        return view
    }()
    lazy var arrayView = [cell1, cell2, cell3, CMLabel, ftLabel, inLabel, continueButton, cursor]
    lazy var continueButton = RedButton(label: "CONTINUE") {
        self.pressedContinueButton?(self.isCM, self.height)
    }
    
    init() {
        super.init(frame: .zero)
        self.configUI()
        textField.delegate = self
        textField.becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength = 3
        if isCM == true {
            maxLength = 3
        } else {
            maxLength = 2
        }
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            if let _ = Int(text) {
                self.height = text
                if isCM == true {
                    switch text.count {
                    case 1:
                        self.cell1.setNumber(text: "")
                        self.cell2.setNumber(text: "")
                        self.cell3.setNumber(text: text)
                        self.configContinue()
                    case 2:
                        self.cell3.setNumber(text: String(text.last!))
                        self.cell2.setNumber(text: String(text.first!))
                        self.cell1.setNumber(text: "")
                    case 3:
                        self.cell3.setNumber(text: String(text.last!))
                        self.cell2.setNumber(text: String(text.dropLast(1).last!))
                        self.cell1.setNumber(text: String(text.first!))
                    default:
                        self.cell1.setNumber(text: "")
                        self.cell2.setNumber(text: "")
                        self.cell3.setNumber(text: "")
                   }
                } else {
                    switch text.count {
                    case 1:
                        self.cell1.setNumber(text: "")
                        self.cell2.setNumber(text: text)
                        self.configContinue()
                    case 2:
                        self.cell2.setNumber(text: String(text.last!))
                        self.cell1.setNumber(text: String(text.first!))
                    default:
                        self.cell1.setNumber(text: "")
                        self.cell2.setNumber(text: "")
                        self.cell3.setNumber(text: "")
                   }
                }
            } else {
                self.cell1.setNumber(text: "")
                self.cell2.setNumber(text: "")
                self.cell3.setNumber(text: "")
                self.continueButton.removeFromSuperview()
            }
        }
    }
}


private extension HeightView {
    func configUI() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        self.backgroundColor = .white
        self.configStepLabel()
        self.configBackButton()
        self.configHeightLabel()
        self.configSwitcher()
        self.configCells()
        self.configTextfield()
        self.configCursor()
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
    func configHeightLabel() {
        self.addSubview(HeightLabel)
        self.HeightLabel.snp.makeConstraints { make in
            make.top.equalTo(stepLabel.snp.bottom).offset(Constraint.qaLabelTop)
            make.centerX.equalToSuperview()
        }
    }
    func configSwitcher() {
        self.addSubview(switcher)
        self.switcher.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.switcher.snp.makeConstraints { make in
            make.top.equalTo(HeightLabel.snp.bottom).offset(Constraint.switcherTop)
            make.centerX.equalToSuperview()
        }
    }
    func configCells() {
        if isCM == true {
            self.addSubview(cell1)
            self.addSubview(cell2)
            self.addSubview(cell3)
            self.addSubview(CMLabel)
            self.cell1.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(61*DisplayScale.width)
                make.top.equalTo(switcher.snp.bottom).offset(Constraint.cellTop)
            }
            self.cell2.snp.makeConstraints { make in
                make.centerY.equalTo(cell1.snp.centerY)
                make.leading.equalTo(cell1.snp.trailing).offset(6*DisplayScale.width)
            }
            self.cell3.snp.makeConstraints { make in
                make.centerY.equalTo(cell1.snp.centerY)
                make.leading.equalTo(cell2.snp.trailing).offset(6*DisplayScale.width)
            }
            self.CMLabel.snp.makeConstraints { make in
                make.bottom.equalTo(cell1.snp.bottom)
                make.leading.equalTo(cell3.snp.trailing).offset(6*DisplayScale.width)
            }
        } else {
            self.addSubview(cell1)
            self.addSubview(cell2)
            self.addSubview(ftLabel)
            self.addSubview(inLabel)
            self.cell1.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(84*DisplayScale.width)
                make.top.equalTo(switcher.snp.bottom).offset(Constraint.cellTop)
            }
            self.ftLabel.snp.makeConstraints { make in
                make.bottom.equalTo(cell1.snp.bottom)
                make.leading.equalTo(cell1.snp.trailing).offset(10*DisplayScale.width)
            }
            self.cell2.snp.makeConstraints { make in
                make.centerY.equalTo(cell1.snp.centerY)
                make.leading.equalTo(ftLabel.snp.trailing).offset(16*DisplayScale.width)
            }
            self.inLabel.snp.makeConstraints { make in
                make.bottom.equalTo(cell1.snp.bottom)
                make.leading.equalTo(cell2.snp.trailing).offset(12*DisplayScale.width)
            }
        }
    }
    func configTextfield() {
        self.addSubview(textField)
        self.textField.snp.makeConstraints { make in
            make.centerY.equalTo(cell1.snp.centerY)
            make.leading.equalTo(cell1.snp.leading)
            make.trailing.equalTo(cell3.snp.trailing)
            make.height.equalTo(cell1.snp.height)
        }
    }
    func configCursor() {
        self.addSubview(cursor)
        self.cursor.snp.makeConstraints { make in
            if isCM == true {
                make.height.equalTo(60*DisplayScale.height)
                make.centerY.equalTo(cell3.snp.centerY)
                make.trailing.equalTo(cell3.snp.trailing).offset(-19*DisplayScale.width)
                make.width.equalTo(2)
            } else {
                make.height.equalTo(60*DisplayScale.height)
                make.centerY.equalTo(cell2.snp.centerY)
                make.trailing.equalTo(cell2.snp.trailing).offset(-19*DisplayScale.width)
                make.width.equalTo(2)
            }
        }
    }
    func configContinue() {
        self.addSubview(continueButton)
        self.continueButton.snp.makeConstraints { make in
            make.top.equalTo(cell1.snp.bottom).offset(73*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(16*DisplayScale.width)
        }
    }
    @objc func onBackButton() {
        self.pressedBackButton?()
    }
    @objc func alarmAlertActivate(){
        UIView.animate(withDuration: 0.5) {
            self.cursor.alpha = self.cursor.alpha == 1.0 ? 0.0 : 1.0
        }
    }
}

extension HeightView: IHeightView {
    
}
