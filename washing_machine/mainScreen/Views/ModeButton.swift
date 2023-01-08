//
//  ModeButton.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 7/1/23.
//

import UIKit

class ModeButton: UIView {
    lazy var indicatorModeCircleView = self.makeCircleIndicatorView()
    lazy var mainTitleLabel = self.makeTitleLabel()
    lazy var subTitleLabel = self.makeSubTitleLabel()
    lazy var tapButton = self.makeButton()
    
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
        self.indicatorModeCircleView.layer.cornerRadius = self.indicatorModeCircleView.bounds.width / 2.0
        self.indicatorModeCircleView.layer.shadowColor = self.indicatorModeCircleView.backgroundColor?.cgColor
    }
    
    func setupView() {
        self.addSubview(self.indicatorModeCircleView)
        self.addSubview(mainTitleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(self.tapButton)
    }
    func setConstraint() {
        NSLayoutConstraint.activate([
            self.indicatorModeCircleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
            self.indicatorModeCircleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0),
            self.indicatorModeCircleView.widthAnchor.constraint(equalToConstant: 8.0),
            self.indicatorModeCircleView.heightAnchor.constraint(equalToConstant: 8.0)
        ])
        NSLayoutConstraint.activate([
            self.subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.mainTitleLabel.leadingAnchor.constraint(equalTo: self.subTitleLabel.leadingAnchor),
            self.mainTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainTitleLabel.bottomAnchor.constraint(equalTo: self.subTitleLabel.topAnchor, constant: -5.0)
        ])
        NSLayoutConstraint.activate([
            self.tapButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tapButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tapButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.tapButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ModeButton {
    func makeCircleIndicatorView() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor.red
        temp.layer.shadowRadius = 8.0
        temp.layer.shadowOpacity = 1
        return temp
    }
    func makeTitleLabel() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Standart"
        temp.textColor = .white
        temp.textAlignment = .left
        temp.font = .boldSystemFont(ofSize: 15.0)
        return temp
    }
    func makeSubTitleLabel() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = UIColor(red: 111/255, green: 116/255, blue: 126/255, alpha: 1.0)
        temp.text = " seconds"
        temp.font = .boldSystemFont(ofSize: 10.0)
        temp.textAlignment = .left
        return temp
    }
    func makeButton() -> UIButton {
        let temp = UIButton()
        temp.backgroundColor = .clear
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10.0
        return temp
    }
}
