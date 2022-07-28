//
//  HealthView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

protocol IHealthView: AnyObject {
    
}

final class HealthView: UIView {
    private lazy var onTap = UITapGestureRecognizer(target: self, action: #selector(self.closeAlert(_:)))
    let scrollView = UIScrollView()
    let contentView = UIView()
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gear"), for: .normal)
        return button
    }()
    let healthLabel: UILabel = {
        let label = UILabel()
        label.text = "Health"
        label.font = AppFont.sfProBold29.font
        label.textColor = .black
        return label
    }()
    let conditionHealthView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.light.color
        view.layer.cornerRadius = 23
        return view
    }()
    let bloodPressureView = ConditionHealthView(image: "blood")
    let oxygenView = ConditionHealthView(image: "oxygen")
    let rateView = ConditionHealthView(image: "rate")
    let heartView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.light.color
        view.layer.cornerRadius = 30
        return view
    }()
    lazy var heartImageView = BigHeartView {
        self.measureCount = self.measureCount + 1
        if self.measureCount != 5 {
            self.measureLabel.removeFromSuperview()
            self.tapLabel.removeFromSuperview()
            self.setUpCircularProgressBarView()
            self.configBPM()
            self.bpmStore = self.bpmRandom
            self.countBPMLabel.text = "\(self.bpmStoreRandom)"
        } else if self.measureCount == 5 {
            self.openAlert()
            self.countBPMLabel.removeFromSuperview()
            self.bPMLabel.removeFromSuperview()
            self.configMeasureLabel()
            self.configTapLabel()
        } else if self.measureCount == 10 {
            self.measureCount = 0
        }
    }
    let circularProgressBarView = CircularProgressBarView(radius: UIScreen.main.bounds.width*0.386)
    let measureLabel: UILabel = {
        let label = UILabel()
        label.text = "MEASURE"
        label.font = AppFont.sfProBold17.font
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    let tapLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to start measure"
        label.font = AppFont.sfProRegular15.font
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var timerSec = Timer()
    var timerMeasure = Timer()
    let countBPMLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProBold48.font
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var bpmRandom: Int { Int.random(in: 40...150) }
    var bpmStore = 0
    var bpmArray = [Int]()
    var bpmStoreRandom: Int { Int.random(in: bpmStore-5...bpmStore+5) }
    let bPMLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.sfProBold17.font
        label.textAlignment = .center
        label.text = "BPM"
        label.textColor = .white
        return label
    }()
    let alertView = AlertView()
    var measureCount = 0
    let lampImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lamp")
        return image
    }()
    let dailyLabel: UILabel = {
        let label = UILabel()
        label.text = "DAILY ADVICE"
        label.font = AppFont.sfProBold17.font
        label.textColor = Color.black.color
        label.textAlignment = .left
        return label
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "You may think all cholesterol is bad, but your body needs some to work right. Cholesterol is a waxy substance that your body makes and you also get from food. It allows your body to make vitamin D and certain hormones, including estrogen in women and testosterone in men, and helps with digestion"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 6
        label.font = AppFont.sfProRegular15.font
        label.textColor = Color.darkGray.color
        label.textAlignment = .left
        return label
    }()
    let pulseLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR PULSE"
        label.font = AppFont.sfProBold17.font
        label.textColor = Color.black.color
        label.textAlignment = .left
        return label
    }()
    let pulseView = UIView()
    let averageView = MeasureView(name: "Average")
    let maximumView = MeasureView(name: "Maximum")
    let todayView = MeasureView(name: "Today")
    let sleepLabel: UILabel = {
        let label = UILabel()
        label.text = "SLEEP TIME"
        label.font = AppFont.sfProBold17.font
        label.textColor = Color.black.color
        label.textAlignment = .left
        return label
    }()
    let sleepView = UIView()
    let beedtimeView = SleepView(name: "Beedtime", image: "bed", time: "23:00", color: Color.blueGreen.color)
    let alarmView = SleepView(name: "Alarm", image: "alarm", time: "07:00", color: Color.violet.color)
    let bedView = SleepView(name: "Average time in bed", image: "clock", time: "7h 44min", color: Color.blue.color)
    let stepLabel: UILabel = {
        let label = UILabel()
        label.text = "Steps goal"
        label.font = AppFont.sfProBold17.font
        label.textColor = Color.black.color
        label.textAlignment = .left
        return label
    }()
    let stepGoalView = UIView()
    let stepView = SleepView(name: "Steps", image: "step", time: "4000/7000 steps", color: Color.purple.color)
    
    init() {
        super.init(frame: .zero)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HealthView {
    func configUI() {
        self.backgroundColor = .white
        self.configScrollView()
        self.configContentView()
        self.configSettingButton()
        self.configHealthLabel()
        self.configConditionHealthView()
        self.configBloodPressureView()
        self.configOxygenView()
        self.configRateView()
        self.configHeartView()
        self.configHeartImageView()
        self.configMeasureLabel()
        self.configTapLabel()
        self.configLampImage()
        self.configDailyLabel()
        self.configTextLabel()
        self.configPulseLabel()
        self.configPulseView()
        self.configAverageView()
        self.configMaxView()
        self.configTodayView()
        self.configSleepLabel()
        self.configSleepView()
        self.configBeedView()
        self.configAlarmView()
        self.configBedView()
        self.configStepLabel()
        self.configStepGoalView()
        self.configStepView()
    }
    func configScrollView() {
        self.addSubview(scrollView)
        self.scrollView.isScrollEnabled = true
        self.scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    func configContentView() {
        self.scrollView.addSubview(contentView)
        self.contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
    }
    func configSettingButton() {
        self.contentView.addSubview(settingButton)
        self.settingButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6*DisplayScale.height)
            make.trailing.equalToSuperview().offset(-14*DisplayScale.width)
        }
    }
    func configHealthLabel() {
        self.contentView.addSubview(healthLabel)
        self.healthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
    }
    func configConditionHealthView() {
        self.contentView.addSubview(conditionHealthView)
        self.conditionHealthView.snp.makeConstraints { make in
            make.top.equalTo(healthLabel.snp.bottom).offset(16*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(8*DisplayScale.width)
            make.height.equalTo(82*DisplayScale.height)
        }
    }
    func configBloodPressureView() {
        self.conditionHealthView.addSubview(bloodPressureView)
        self.bloodPressureView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
        }
    }
    func configOxygenView() {
        self.conditionHealthView.addSubview(oxygenView)
        self.oxygenView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(bloodPressureView.snp.trailing).offset(5*DisplayScale.width)
        }
    }
    func configRateView() {
        self.conditionHealthView.addSubview(rateView)
        self.rateView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(oxygenView.snp.trailing).offset(5*DisplayScale.width)
        }
    }
    func configHeartView() {
        self.contentView.addSubview(heartView)
        self.heartView.snp.makeConstraints { make in
            make.top.equalTo(conditionHealthView.snp.bottom).offset(8*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(8*DisplayScale.width)
            make.height.equalTo(heartView.snp.width)
        }
    }
    func configHeartImageView() {
        self.heartView.addSubview(heartImageView)
        self.heartImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(296*DisplayScale.width)
        }
    }
    func configMeasureLabel() {
        self.heartView.addSubview(measureLabel)
        self.measureLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(173*DisplayScale.height)
            make.centerX.equalToSuperview()
        }
    }
    func configTapLabel() {
        self.heartView.addSubview(tapLabel)
        self.tapLabel.snp.makeConstraints { make in
            make.top.equalTo(measureLabel.snp.bottom).offset(6*DisplayScale.height)
            make.centerX.equalToSuperview()
        }
    }
    func configBPM() {
        self.heartView.addSubview(countBPMLabel)
        self.heartView.addSubview(bPMLabel)
        self.countBPMLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150*DisplayScale.height)
            make.centerX.equalToSuperview()
        }
        self.bPMLabel.snp.makeConstraints { make in
            make.top.equalTo(countBPMLabel.snp.bottom).offset(2*DisplayScale.height)
            make.centerX.equalToSuperview()
        }
    }
    func configAlert() {
        self.contentView.addSubview(alertView)
        self.alertView.snp.makeConstraints { make in
            make.height.equalTo(92*DisplayScale.height)
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16*DisplayScale.width)
        }
    }
    func configLampImage() {
        self.contentView.addSubview(lampImage)
        self.lampImage.snp.makeConstraints { make in
            make.top.equalTo(heartView.snp.bottom).offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(24*DisplayScale.width)
        }
    }
    func configDailyLabel() {
        self.contentView.addSubview(dailyLabel)
        self.dailyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lampImage.snp.centerY)
            make.leading.equalTo(lampImage.snp.trailing).offset(4*DisplayScale.width)
        }
    }
    func configTextLabel() {
        self.contentView.addSubview(textLabel)
        self.textLabel.snp.makeConstraints { make in
            make.top.equalTo(dailyLabel.snp.bottom).offset(10*DisplayScale.height)
            make.leading.equalToSuperview().inset(24*DisplayScale.width)
            make.width.equalTo(332*DisplayScale.width)
        }
    }
    func configPulseLabel() {
        self.contentView.addSubview(pulseLabel)
        self.pulseLabel.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
    }
    func configPulseView() {
        self.contentView.addSubview(pulseView)
        self.pulseView.backgroundColor = Color.light.color
        self.pulseView.layer.cornerRadius = 24
        self.pulseView.snp.makeConstraints { make in
            make.top.equalTo(pulseLabel.snp.bottom).offset(8*DisplayScale.height)
            make.height.equalTo(208*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(8*DisplayScale.width)
        }
    }
    func configAverageView() {
        self.pulseView.addSubview(averageView)
        self.averageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8*DisplayScale.height)
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
            make.width.equalTo(169*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configMaxView() {
        self.pulseView.addSubview(maximumView)
        self.maximumView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8*DisplayScale.height)
            make.trailing.equalToSuperview().offset(-8*DisplayScale.width)
            make.width.equalTo(169*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configTodayView() {
        self.pulseView.addSubview(todayView)
        self.todayView.snp.makeConstraints { make in
            make.top.equalTo(averageView.snp.bottom).offset(5*DisplayScale.height)
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
            make.trailing.equalToSuperview().offset(-8*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configSleepLabel() {
        self.contentView.addSubview(sleepLabel)
        self.sleepLabel.snp.makeConstraints { make in
            make.top.equalTo(pulseView.snp.bottom).offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
    }
    func configSleepView() {
        self.contentView.addSubview(sleepView)
        self.sleepView.backgroundColor = Color.light.color
        self.sleepView.layer.cornerRadius = 24
        self.sleepView.snp.makeConstraints { make in
            make.top.equalTo(sleepLabel.snp.bottom).offset(8*DisplayScale.height)
            make.height.equalTo(212*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(8*DisplayScale.width)
        }
    }
    func configBeedView() {
        self.sleepView.addSubview(beedtimeView)
        self.beedtimeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8*DisplayScale.height)
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
            make.width.equalTo(169*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configAlarmView() {
        self.sleepView.addSubview(alarmView)
        self.alarmView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8*DisplayScale.height)
            make.trailing.equalToSuperview().offset(-8*DisplayScale.width)
            make.width.equalTo(169*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configBedView() {
        self.sleepView.addSubview(bedView)
        self.bedView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8*DisplayScale.height)
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
            make.trailing.equalToSuperview().offset(-8*DisplayScale.width)
            make.height.equalTo(93*DisplayScale.height)
        }
    }
    func configStepLabel() {
        self.contentView.addSubview(stepLabel)
        self.stepLabel.snp.makeConstraints { make in
            make.top.equalTo(sleepView.snp.bottom).offset(16*DisplayScale.height)
            make.leading.equalToSuperview().offset(16*DisplayScale.width)
        }
    }
    func configStepGoalView() {
        self.contentView.addSubview(stepGoalView)
        self.stepGoalView.backgroundColor = Color.light.color
        self.stepGoalView.layer.cornerRadius = 24
        self.stepGoalView.snp.makeConstraints { make in
            make.top.equalTo(stepLabel.snp.bottom).offset(8*DisplayScale.height)
            make.height.equalTo(101*DisplayScale.height)
            make.leading.trailing.equalToSuperview().inset(8*DisplayScale.width)
            make.bottom.equalToSuperview()
        }
    }
    func configStepView() {
        self.stepGoalView.addSubview(stepView)
        self.stepView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8*DisplayScale.height)
            make.leading.equalToSuperview().offset(8*DisplayScale.width)
            make.trailing.equalToSuperview().offset(-8*DisplayScale.width)
            make.height.equalTo(85*DisplayScale.height)
        }
    }
    
    
    
    func setUpCircularProgressBarView() {
        self.alertView.removeFromSuperview()
        self.heartImageView.isUserInteractionEnabled = false
        let circularViewDuration: TimeInterval = {
            let time = Double.random(in: 7...12)
            return time
        }()
        self.heartView.addSubview(circularProgressBarView)
        self.circularProgressBarView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        circularProgressBarView.createCircularPath()
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        self.timerMeasure = Timer.scheduledTimer(timeInterval: circularViewDuration, target: self, selector: #selector(updateMeasure), userInfo: nil, repeats: false)
        self.timerSec = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSec), userInfo: nil, repeats: true)
    }
    @objc func updateSec(_ sender: UITapGestureRecognizer? = nil) {
        self.countBPMLabel.text = "\(self.bpmStoreRandom)"
    }
    @objc func updateMeasure(_ sender: UITapGestureRecognizer? = nil) {
        self.bpmArray.append(self.bpmStore)
        self.timerSec.invalidate()
        self.heartImageView.isUserInteractionEnabled = true
        self.countBPMLabel.text = "\(bpmStore)"
        self.circularProgressBarView.removeFromSuperview()
        self.updateLabels()
    }
    @objc func closeAlert(_ sender: UITapGestureRecognizer? = nil) {
        self.alertView.removeFromSuperview()
    }
    func updateLabels() {
        self.todayView.changeBPM(bpm: self.bpmStore)
        self.maximumView.changeBPM(bpm: self.bpmArray.max()!)
        var average = 0
        for i in bpmArray {
            average = average + i
        }
        self.averageView.changeBPM(bpm: average/bpmArray.count)
    }
    func openAlert() {
        self.configAlert()
        self.addGestureRecognizer(onTap)
    }
}

extension HealthView: IHealthView {
    
}
