//
//  ModeButtonView.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 7/1/23.
//

import UIKit

class ModeButtonView: UIView {
    
    lazy var mainTitle: UILabel = self.makeTitle()
    lazy var mainContainerStackView = self.makeStackView()
    
    lazy var standartContainerView = self.makeModeContainerView()
    lazy var gentleContainerView = self.makeModeContainerView()
    lazy var fastContainerView = self.makeModeContainerView()
    
    lazy var modeIndicator = self.makeIndicatorModeView()
    lazy var indicatorColors = self.makeIndicatorColors()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func modeIndicatorSettingsView() {
        self.modeIndicator.layer.cornerRadius = self.modeIndicator.bounds.width / 2.0
    }
    
    func setupView() {
        self.addSubview(self.mainTitle)
        self.addSubview(self.mainContainerStackView)
        
        self.mainContainerStackView.addArrangedSubview(self.standartContainerView)
        self.mainContainerStackView.addArrangedSubview(self.gentleContainerView)
        self.mainContainerStackView.addArrangedSubview(self.fastContainerView)
        
        let indicatorContainer = [self.standartContainerView, self.gentleContainerView, self.fastContainerView]
        let mainTitles = ["Standart", "Gentle", "Fast"]
        for item in 0..<indicatorContainer.count {
            indicatorContainer[item].indicatorModeCircleView.backgroundColor = self.indicatorColors[item]
            indicatorContainer[item].mainTitleLabel.text = mainTitles[item]
            indicatorContainer[item].tapButton.tag = item
        }
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            self.mainTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.mainTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainTitle.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        NSLayoutConstraint.activate([
            self.mainContainerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10.0),
            self.mainContainerStackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            self.mainContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
            self.mainContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0)
        ])
    }
}

extension ModeButtonView {
    func makeTitle() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Mode"
        temp.textColor = .white
        temp.font = .boldSystemFont(ofSize: 20.0)
        temp.textAlignment = .left
        return temp
    }
    
    func makeStackView() -> UIStackView {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.distribution = .fillEqually
        temp.spacing = 15.0
        return temp
    }
    
    func makeModeContainerView() -> ModeButton {
        let temp = ModeButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 46/255, green: 51/255, blue: 54/255, alpha: 1.0)
        temp.layer.shadowColor = UIColor.white.cgColor
        temp.layer.shadowOffset = .init(width: -2.0, height: -5.0)
        temp.layer.shadowOpacity = 0.15
        temp.layer.shadowRadius = 4.0
        temp.layer.cornerRadius = 10.0
        temp.clipsToBounds = true
        return temp
    }
    
    func makeIndicatorModeView() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    
    func makeIndicatorColors() -> [UIColor] {
        let temp = [
            UIColor(red: 69/255, green: 104/255, blue: 231/255, alpha: 1.0),
            UIColor(red: 96/255, green: 186/255, blue: 236/255, alpha: 1.0),
            UIColor(red: 236/255, green: 145/255, blue: 81/255, alpha: 1.0)
        ]
        return temp
    }
}
