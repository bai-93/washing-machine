//
//  WashingMachineContentView.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 5/1/23.
//

import UIKit

class WashingMachineContentView: UIView {
    
    //MARK: - behaviour engine properties
    var dynamicAnimator: UIDynamicAnimator = UIDynamicAnimator()
    var collisionBehaviour: UICollisionBehavior = UICollisionBehavior()
    var gravityBehaviour: UIGravityBehavior = UIGravityBehavior()
    var itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior()
    var vortextBehaviour = UIFieldBehavior.vortexField()
    
    //MARK: - ui properties
    var dirtyClothes: [UIImageView] = []
    lazy var settingsButtonLeftTop: UIButton = self.makeSettingsButton()
    lazy var timerParentContainer: UIView = self.makeTimeContainer()
    lazy var timerLabels: UILabel = self.makeLabelTime()
    
    //MARK: - top label properties
    lazy var smartWashingMachineLabel = self.makeSmartWashingLabel()
    lazy var machineLabel = self.makeMachineLabel()
    lazy var containerStackTitle = self.makeMainTitlesStack()
    
    //MARK: - washing machine properties
    lazy var washingMachineParentContainer = self.makeWashingMachineContainer()
    lazy var washingMachineFirstContainer = self.makeWashingMachineFirstContainer()
    lazy var washingMachineSecondContainer = self.makeWashingMachineSecondContainer()
    lazy var washingMachineThirdContainer = self.makeWashingMachineThirdContainer()
    lazy var drumPropellerImageView = self.makeDrumPropellerImage()
    
    //MARK: - dirty balls stored properties
    lazy var ballsClothesStored: [UIImageView] = self.makeBallsImageView()
    
    //MARK: - left side buttons properties
    lazy var indicatorModeContainer = self.makeIndicatorModeWashingView()
    lazy var indicatorModeParentView = self.makeIndicatorModeWashingView()
    lazy var indicatorModeView = self.makeIndicatorModeWashingView()
    lazy var powerButton = self.makeSettingsButton()
    lazy var waterButton = self.makeSettingsButton()
    lazy var playButton = self.makeSettingsButton()
    lazy var leftSideButtonsStackView = self.makeMainTitlesStack()
    
    //MARK: - bottom properties
    lazy var bottomButtonPartView = self.makeBottomPartView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 32/255, green: 36/255, blue: 42/255, alpha: 1.0)
        
        self.setupView()
        self.setConstraint()
        self.leftSideUIsettings()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.washingMachineParentContainer.layer.cornerRadius = self.washingMachineParentContainer.bounds.width / 2.0
        self.washingMachineFirstContainer.layer.cornerRadius = self.washingMachineFirstContainer.bounds.width / 2.0
        self.washingMachineSecondContainer.layer.cornerRadius = self.washingMachineSecondContainer.bounds.width / 2.0
        self.washingMachineThirdContainer.layer.cornerRadius = self.washingMachineThirdContainer.bounds.width / 2.0
        self.drumPropellerImageView.layer.cornerRadius = self.drumPropellerImageView.bounds.width / 2.0
        
        self.indicatorModeParentView.layer.cornerRadius = self.indicatorModeParentView.bounds.width / 2.0
        self.indicatorModeView.layer.cornerRadius = indicatorModeView.bounds.width / 2.0
        
//        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotate.fromValue = 0
//        rotate.toValue = -CGFloat.pi * 2
//        rotate.duration = 1
//        rotate.repeatCount = 10
//        self.washingMachineThirdContainer.layer.add(rotate, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        //top views
        self.addSubview(self.settingsButtonLeftTop)
        self.addSubview(self.timerParentContainer)
        self.timerParentContainer.addSubview(self.timerLabels)
        
        //Main title
        self.addSubview(self.containerStackTitle)
        self.containerStackTitle.addArrangedSubview(self.smartWashingMachineLabel)
        self.containerStackTitle.addArrangedSubview(self.machineLabel)
        
        //washing machine drum design
        self.addSubview(self.washingMachineParentContainer)
        self.washingMachineParentContainer.addSubview(self.washingMachineFirstContainer)
        self.washingMachineFirstContainer.addSubview(self.washingMachineSecondContainer)
        self.washingMachineSecondContainer.addSubview(self.washingMachineThirdContainer)
        self.washingMachineThirdContainer.addSubview(self.drumPropellerImageView)
        
        //left side buttons
        self.addSubview(self.leftSideButtonsStackView)
        self.indicatorModeParentView.addSubview(self.indicatorModeView)
        self.indicatorModeContainer.addSubview(self.indicatorModeParentView)
        self.leftSideButtonsStackView.addArrangedSubview(self.indicatorModeContainer)
        self.leftSideButtonsStackView.addArrangedSubview(self.powerButton)
        self.leftSideButtonsStackView.addArrangedSubview(self.waterButton)
        self.leftSideButtonsStackView.addArrangedSubview(self.playButton)
        
        //bottom part view
        self.addSubview(self.bottomButtonPartView)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            self.settingsButtonLeftTop.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.settingsButtonLeftTop.topAnchor.constraint(equalTo: self.topAnchor, constant: 40.0),
            self.settingsButtonLeftTop.heightAnchor.constraint(equalToConstant: 40.0),
            self.settingsButtonLeftTop.widthAnchor.constraint(equalToConstant: 40.0)
        ])
        NSLayoutConstraint.activate([
            self.timerParentContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
            self.timerParentContainer.centerYAnchor.constraint(equalTo: self.settingsButtonLeftTop.centerYAnchor),
            self.timerParentContainer.heightAnchor.constraint(equalToConstant: 45.0)
        ])
        NSLayoutConstraint.activate([
            self.timerLabels.leadingAnchor.constraint(equalTo: self.timerParentContainer.leadingAnchor, constant: 20.0),
            self.timerLabels.trailingAnchor.constraint(equalTo: self.timerParentContainer.trailingAnchor, constant: -20.0),
            self.timerLabels.centerYAnchor.constraint(equalTo: self.timerParentContainer.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            self.containerStackTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.containerStackTitle.topAnchor.constraint(equalTo: self.settingsButtonLeftTop.bottomAnchor, constant: 30.0)
        ])
        NSLayoutConstraint.activate([
            self.washingMachineParentContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10.0),
            self.washingMachineParentContainer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            self.washingMachineParentContainer.heightAnchor.constraint(equalTo: self.washingMachineParentContainer.widthAnchor, multiplier: 1.0),
            self.washingMachineParentContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80.0)
        ])
        NSLayoutConstraint.activate([
            self.washingMachineFirstContainer.leadingAnchor.constraint(equalTo: self.washingMachineParentContainer.leadingAnchor, constant: 15.0),
            self.washingMachineFirstContainer.trailingAnchor.constraint(equalTo: self.washingMachineParentContainer.trailingAnchor, constant: -15.0),
            self.washingMachineFirstContainer.topAnchor.constraint(equalTo: self.washingMachineParentContainer.topAnchor, constant: 15.0),
            self.washingMachineFirstContainer.bottomAnchor.constraint(equalTo: self.washingMachineParentContainer.bottomAnchor, constant: -15.0)
        ])
        NSLayoutConstraint.activate([
            self.washingMachineSecondContainer.leadingAnchor.constraint(equalTo: self.washingMachineFirstContainer.leadingAnchor, constant: 25.0),
            self.washingMachineSecondContainer.trailingAnchor.constraint(equalTo: self.washingMachineFirstContainer.trailingAnchor, constant: -25.0),
            self.washingMachineSecondContainer.topAnchor.constraint(equalTo: self.washingMachineFirstContainer.topAnchor, constant: 25.0),
            self.washingMachineSecondContainer.bottomAnchor.constraint(equalTo: self.washingMachineFirstContainer.bottomAnchor, constant: -25.0)
        ])
        NSLayoutConstraint.activate([
            self.washingMachineThirdContainer.leadingAnchor.constraint(equalTo: self.washingMachineSecondContainer.leadingAnchor, constant: 5.0),
            self.washingMachineThirdContainer.trailingAnchor.constraint(equalTo: self.washingMachineSecondContainer.trailingAnchor, constant: -5.0),
            self.washingMachineThirdContainer.topAnchor.constraint(equalTo: self.washingMachineSecondContainer.topAnchor, constant: 5.0),
            self.washingMachineThirdContainer.bottomAnchor.constraint(equalTo: self.washingMachineSecondContainer.bottomAnchor, constant: -5.0)
        ])
        NSLayoutConstraint.activate([
            self.drumPropellerImageView.leadingAnchor.constraint(equalTo: self.washingMachineThirdContainer.leadingAnchor),
            self.drumPropellerImageView.trailingAnchor.constraint(equalTo: self.washingMachineThirdContainer.trailingAnchor),
            self.drumPropellerImageView.topAnchor.constraint(equalTo: self.washingMachineThirdContainer.topAnchor),
            self.drumPropellerImageView.bottomAnchor.constraint(equalTo: self.washingMachineThirdContainer.bottomAnchor, constant: -33.0)
        ])
        NSLayoutConstraint.activate([
            self.indicatorModeContainer.heightAnchor.constraint(equalToConstant: 45.0),
            self.indicatorModeParentView.centerYAnchor.constraint(equalTo: self.indicatorModeContainer.centerYAnchor),
            self.indicatorModeParentView.centerXAnchor.constraint(equalTo: self.indicatorModeContainer.centerXAnchor),
            
            self.indicatorModeParentView.heightAnchor.constraint(equalTo: self.indicatorModeContainer.heightAnchor, multiplier: 0.6),
            self.indicatorModeParentView.widthAnchor.constraint(equalTo: self.indicatorModeContainer.widthAnchor, multiplier: 0.6),
            self.indicatorModeView.centerXAnchor.constraint(equalTo: self.indicatorModeParentView.centerXAnchor),
            self.indicatorModeView.centerYAnchor.constraint(equalTo: self.indicatorModeParentView.centerYAnchor),
            self.indicatorModeView.heightAnchor.constraint(equalTo: self.indicatorModeParentView.heightAnchor, multiplier: 0.4),
            self.indicatorModeView.widthAnchor.constraint(equalTo: self.indicatorModeParentView.widthAnchor, multiplier: 0.4),
            
            self.powerButton.heightAnchor.constraint(equalToConstant: 45.0),
            self.waterButton.heightAnchor.constraint(equalToConstant: 45.0),
            self.playButton.heightAnchor.constraint(equalToConstant: 45.0)
        ])
        NSLayoutConstraint.activate([
            self.leftSideButtonsStackView.leadingAnchor.constraint(equalTo: self.settingsButtonLeftTop.leadingAnchor),
            self.leftSideButtonsStackView.centerYAnchor.constraint(equalTo: self.washingMachineParentContainer.centerYAnchor),
            self.leftSideButtonsStackView.widthAnchor.constraint(equalToConstant: 45.0)
        ])
        NSLayoutConstraint.activate([
            self.bottomButtonPartView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.bottomButtonPartView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.bottomButtonPartView.topAnchor.constraint(equalTo: self.washingMachineParentContainer.bottomAnchor),
            self.bottomButtonPartView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setInitialLocaltionsDirtyClothes() {
        var previousFrame: CGRect = .zero
        var firstFlag = true
        let radiusWashing = self.washingMachineThirdContainer.bounds.size
        for item in self.ballsClothesStored {
            self.washingMachineThirdContainer.addSubview(item)
            if (firstFlag) {
                firstFlag = false
                item.frame.origin = .init(x: 30, y: 30)
                previousFrame = item.frame
            } else {
                previousFrame.origin = .init(x: previousFrame.origin.x + 25.0, y: 25.0)
                if (previousFrame.origin.x > radiusWashing.width/2.0 || previousFrame.origin.y > radiusWashing.height/2.0) {
                    previousFrame.origin = .init(x: radiusWashing.height * 0.25, y: radiusWashing.width * 0.22)
                }
                item.frame = previousFrame
            }
        }
    }
    
    func setupBehaviours() {
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.washingMachineThirdContainer)
        
        self.collisionBehaviour = UICollisionBehavior(items: self.ballsClothesStored)
        self.collisionBehaviour.addBoundary(withIdentifier: "identifier" as NSCopying, for: UIBezierPath(ovalIn: self.washingMachineThirdContainer.frame))
        self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        self.gravityBehaviour = UIGravityBehavior(items: self.ballsClothesStored)
        
        self.vortextBehaviour.position = self.washingMachineThirdContainer.center
        self.vortextBehaviour.animationSpeed = 0.09
        self.vortextBehaviour.strength = 0.0
        self.vortextBehaviour.region = .init(radius: self.washingMachineThirdContainer.bounds.height/2.0)
        
        for item in self.ballsClothesStored {
            self.vortextBehaviour.addItem(item)
        }
        self.itemBehaviour.elasticity = 0.5
        self.dynamicAnimator.addBehavior(self.vortextBehaviour)
        self.dynamicAnimator.addBehavior(self.itemBehaviour)
        self.dynamicAnimator.addBehavior(self.collisionBehaviour)
        self.dynamicAnimator.addBehavior(self.gravityBehaviour)
    }
    
    func leftSideUIsettings() {
        self.indicatorModeContainer.backgroundColor = .clear
        self.indicatorModeParentView.layer.shadowOpacity = 0.05
        self.indicatorModeParentView.layer.shadowOffset = .init(width: -2.0, height: -6.0)
        self.indicatorModeView.backgroundColor = UIColor(red: 69/255, green: 103/255, blue: 230/255, alpha: 1.0)
        self.indicatorModeView.layer.borderWidth = 0.5
        self.leftSideButtonsStackView.distribution = .fill
        self.leftSideButtonsStackView.spacing = 20.0
    }
}
//MARK: - make helper views extension
extension WashingMachineContentView {
    func makeTimeContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 46/255, green: 52/255, blue: 56/255, alpha: 1.0)
        temp.layer.cornerRadius = 10.0
        temp.layer.borderWidth = 2.0
        temp.layer.borderColor = UIColor(red: 62/255, green: 64/255, blue: 67/255, alpha: 1.0).cgColor
        return temp
    }
    func makeLabelTime() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = .boldSystemFont(ofSize: 20.0)
        temp.textColor = UIColor(red: 128/255, green: 132/255, blue: 145/255, alpha: 1.0)
        temp.text = "00:00"
        temp.textAlignment = .center
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = .init(width: -3.0, height: -5.0)
        temp.layer.shadowOpacity = 0.3
        return temp
    }
    func makeWashingMachineContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 45/255, green: 50/255, blue: 56/255, alpha: 1.0)
        temp.layer.shadowColor = UIColor.white.cgColor
        temp.layer.shadowOffset = .init(width: -4.0, height: -6.0)
        temp.layer.shadowRadius = 10.0
        temp.layer.shadowOpacity = 0.08
        temp.layer.borderWidth = 3.0
        temp.layer.borderColor = UIColor(red: 33/255, green: 36/255, blue: 40/255, alpha: 1.0).cgColor
        return temp
    }
    func makeWashingMachineFirstContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 56/255, green: 62/255, blue: 68/255, alpha: 1.0)
        return temp
    }
    func makeWashingMachineSecondContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 27/255, green: 29/255, blue: 35/255, alpha: 1.0)
        return temp
    }
    func makeWashingMachineThirdContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 32/255, green: 35/255, blue: 40/255, alpha: 1.0)
        temp.clipsToBounds = true
        return temp
    }
    func makeDrumPropellerImage() -> UIImageView {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = UIImage(named: "drumPropeller")
        temp.contentMode = .scaleAspectFill
        temp.layer.actions = ["transform.rotation.z" : NSNull(), "transform" : NSNull()]
        return temp
    }
    func makeSettingsButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 41/255, green: 50/255, blue: 54/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOffset = .init(width: -2.0, height: -3.0)
        button.layer.shadowOpacity = 0.15
        return button
    }
    func makeMainTitlesStack() -> UIStackView {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .fill
        temp.spacing = 5.0
        temp.distribution = .fill
        return temp
    }
    func makeSmartWashingLabel() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Smart Washing"
        temp.textColor = UIColor(red: 251/255, green: 250/255, blue: 250/255, alpha: 1.0)
        temp.textAlignment = .center
        temp.font = .boldSystemFont(ofSize: 27.0)
        return temp
    }
    func makeMachineLabel() -> UILabel {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = UIColor(red: 251/255, green: 250/255, blue: 250/255, alpha: 1.0)
        temp.text = "Machine"
        temp.font = .boldSystemFont(ofSize: 20.0)
        return temp
    }
    func makeIndicatorModeWashingView() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(red: 41/255, green: 50/255, blue: 54/255, alpha: 1.0)
        temp.layer.shadowColor = UIColor.white.cgColor
        temp.layer.shadowRadius = 4.0
        temp.layer.shadowOffset = .init(width: -2.0, height: -3.0)
        temp.layer.shadowOpacity = 0.15
        return temp
    }
    func makeBottomPartView() -> ModeButtonView {
        let temp = ModeButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }
    func makeBallsImageView() -> [UIImageView] {
        var imageStorageHolder: [UIImageView] = []
        for item in 0..<16 {
            var nameOfImage = ""
            var tagImage = 100
            let imageView = UIImageView()
            let ciContext = CIContext(options: nil)
            switch item {
            case 0..<4:
                nameOfImage = "Ellipse1"
                tagImage = 1
            case 4..<8:
                nameOfImage = "Ellipse2"
                tagImage = 2
            case 8..<12:
                nameOfImage = "Ellipse3"
                tagImage = 3
            case 12..<16:
                nameOfImage = "Ellipse4"
                tagImage = 4
            default:
                print("another case")
            }
            imageView.image = .init(named: nameOfImage)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 12
            imageView.frame.size = .init(width: 24.0, height: 24.0)
            imageView.tag = tagImage
            
            
            let blur = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blur)
            blurEffectView.frame = imageView.bounds
            blurEffectView.alpha = 1
            blurEffectView.layer.opacity = 0.2
            blurEffectView.layer.cornerRadius = 12
            
            imageView.addSubview(blurEffectView)
            imageView.layer.shadowRadius = 10.0
            blurEffectView.clipsToBounds = true
            
            imageStorageHolder.append(imageView)
        }
        imageStorageHolder.shuffle()
        return imageStorageHolder
    }
}
