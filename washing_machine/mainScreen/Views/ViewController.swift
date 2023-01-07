//
//  ViewController.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 8/11/22.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    var viewModel: MainScreenViewModel = MainScreenViewModel()
    lazy var timeContainer: UIView = self.makeContainer()
    lazy var washingMachineView: UIView = self.makeContainer()
    lazy var circleView: UIImageView = self.makeImageView()
    lazy var vortextView: UIView = self.makeVortextView()
    lazy var contenView: WashingMachineContentView = self.makeWachingMachineContentView()
    
    var dynamicAnimator: UIDynamicAnimator = UIDynamicAnimator()
    var collisionBehaviour: UICollisionBehavior = UICollisionBehavior()
    var gravityBehaviour: UIGravityBehavior = UIGravityBehavior()
    var itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior()
    var vortextBehaviour = UIFieldBehavior.vortexField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 33.0/255.0, green: 35.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        
//        self.setupView()
//        self.setupConstraints()
//        self.viewModel.delegate = self
        
        self.view.addSubview(self.contenView)
        
        self.setupConstraints()
    }
    
    func setupView() {
        self.view.addSubview(self.washingMachineView)
        self.washingMachineView.addSubview(self.circleView)
        self.washingMachineView.addSubview(self.vortextView)
        self.washingMachineView.backgroundColor = .clear
        self.washingMachineView.layer.cornerRadius = self.view.bounds.width / 2.0
        self.vortextView.frame.size = .init(width: 50.0, height: 50.0)
        self.vortextView.layer.cornerRadius = 25.0
        self.vortextView.clipsToBounds = true
//        self.circleView.backgroundColor = UIColor(red: 57.0/255.0, green: 37.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        self.circleView.layer.cornerRadius = 10.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.vortextView.center = .init(x: self.washingMachineView.bounds.midX, y: self.washingMachineView.bounds.midY)
//        self.setupBehaviours()
//
//        self.perform(#selector(self.changeVortexStrengh), with: nil, afterDelay: 6.0)
//        self.perform(#selector(self.changeImage), with: nil, afterDelay: 15.0)
//        print("this message after perform")
        self.contenView.setInitialLocaltionsDirtyClothes()
        self.contenView.setupBehaviours()
    }
    
    @objc func changeVortexStrengh() {
        print("we changed strength")
        self.vortextBehaviour.strength = 0.5
    }
    
    @objc func changeImage() {
        print("change image was call")
        self.circleView.frame.size = .init(width: 35.0, height: 35.0)
        self.circleView.image = .init(named: "Ellipse2")
        print("and vortex behaviour to zero")
        self.vortextBehaviour.strength = 0.0
    }
    
    func setupBehaviours() {
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.washingMachineView)
        
        self.collisionBehaviour = UICollisionBehavior(items: [self.circleView])
        self.collisionBehaviour.addBoundary(withIdentifier: "identifier" as NSCopying, for: UIBezierPath(ovalIn: self.washingMachineView.bounds))
        self.collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        self.gravityBehaviour = UIGravityBehavior(items: [self.circleView])
        
        self.circleView.center = self.washingMachineView.center
        self.circleView.frame.origin.y = 0.0
        
        self.vortextBehaviour.position = self.vortextView.center
        self.vortextBehaviour.animationSpeed = 0.09
        self.vortextBehaviour.strength = 0.05
        self.vortextBehaviour.region = .init(radius: 200)
        
        self.vortextBehaviour.addItem(self.circleView)
        self.dynamicAnimator.addBehavior(self.vortextBehaviour)
        self.dynamicAnimator.addBehavior(self.itemBehaviour)
        self.dynamicAnimator.addBehavior(self.collisionBehaviour)
        self.dynamicAnimator.addBehavior(self.gravityBehaviour)
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            self.washingMachineView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.washingMachineView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.washingMachineView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),
//            self.washingMachineView.heightAnchor.constraint(equalTo: self.washingMachineView.widthAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            self.contenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.contenView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.contenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController {
    func makeContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        return temp
    }
    
    func makeVortextView() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .yellow
        return temp
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        let ciContext = CIContext(options: nil)
        imageView.image = .init(named: "Ellipse2")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20.0
        imageView.frame.size = .init(width: 40.0, height: 40.0)
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let image = CIImage(image: imageView.image!)
        currentFilter!.setValue(image, forKey: kCIInputImageKey)
        currentFilter!.setValue(10.0, forKey: kCIInputRadiusKey)
        guard let filteredImage = currentFilter?.outputImage else { return .init() }
        let outputImage = ciContext.createCGImage(filteredImage, from: filteredImage.extent)
        imageView.image = .init(cgImage: outputImage!)
        return imageView
    }
    
    func makeWachingMachineContentView() -> WashingMachineContentView {
        let content = WashingMachineContentView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }
}

extension ViewController: UIControlDelegate {
    func timerUpdate(currentTime: Double) {
        
    }
    
    func resetTimer() {
        
    }
    
    func startWashingMachine() {
        
    }
    
    func stopWashingMachine() {
        
    }
}
