//
//  ViewController.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 8/11/22.
//
// Colors of balls in washing machine cyan(111.0/255.0 227.0/255.0/ 226/255.0) blue(57.0/255.0 37.0/255.0 241.0/255.0) orange(234.0/255.0 120.0/255.0 58.0/255.0) pink(231.0/255.0 82.0/255.0 189.0/255.0)

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {
    lazy var timeContainer: UIView = self.makeContainer()
    lazy var washingMachineView: UIView = self.makeContainer()
    lazy var circleView: UIImageView = self.makeImageView()
    lazy var vortextView: UIView = self.makeVortextView()
    
    var dynamicAnimator: UIDynamicAnimator = UIDynamicAnimator()
    var collisionBehaviour: UICollisionBehavior = UICollisionBehavior()
    var gravityBehaviour: UIGravityBehavior = UIGravityBehavior()
    var itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior()
    var vortextBehaviour = UIFieldBehavior.vortexField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 33.0/255.0, green: 35.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        
        self.setupView()
        self.setupConstraints()
//        self.setupInnerView()
        
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
    
    func settingsWashingMachine () {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.vortextView.center = .init(x: self.washingMachineView.bounds.midX, y: self.washingMachineView.bounds.midY)
        self.addBlur()
        self.setupBehaviours()
        
        self.perform(#selector(self.changeVortexStrengh), with: nil, afterDelay: 6.0)
        self.perform(#selector(self.changeImage), with: nil, afterDelay: 15.0)
        print("this message after perform")
    }
    
    @objc func changeVortexStrengh() {
        print("we changed strength")
        self.vortextBehaviour.strength = 0.5
    }
    
    @objc func changeImage() {
        print("change image was call")
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
//        self.itemBehaviour.elasticity = 1
        
        self.dynamicAnimator.addBehavior(self.vortextBehaviour)
        self.dynamicAnimator.addBehavior(self.itemBehaviour)
        self.dynamicAnimator.addBehavior(self.collisionBehaviour)
        self.dynamicAnimator.addBehavior(self.gravityBehaviour)
    }
    
    func setupInnerView() {
        self.circleView.frame.size = .init(width: 20.0, height: 20.0)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.washingMachineView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.washingMachineView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.washingMachineView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0),
            self.washingMachineView.heightAnchor.constraint(equalTo: self.washingMachineView.widthAnchor)
        ])
    }
    
    func addBlur() {
//        let blur = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blur)
//        blurEffectView.frame = self.circleView.bounds
//        blurEffectView.alpha = 1
//        blurEffectView.layer.opacity = 0.5
//        blurEffectView.layer.cornerRadius = 30.0
//        blurEffectView.clipsToBounds = true
//        self.circleView.addSubview(blurEffectView)
//        self.circleView.layer.shadowRadius = 10.0
        
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
//        imageView.backgroundColor = UIColor(red: 57.0/255.0, green: 37.0/255.0, blue: 241.0/255.0, alpha: 1.0)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.shadowRadius = 10.0
//        imageView.layer.shadowOpacity = 1
//        imageView.layer.shadowColor = UIColor(red: 57.0/255.0, green: 37.0/255.0, blue: 241.0/255.0, alpha: 1.0).cgColor
//        imageView.layer.masksToBounds = false
        imageView.image = .init(named: "Ellipse2")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20.0
        imageView.frame.size = .init(width: 40.0, height: 40.0)
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let image = CIImage(image: imageView.image!)
        currentFilter!.setValue(image, forKey: kCIInputImageKey)
        currentFilter!.setValue(20.0, forKey: kCIInputRadiusKey)
        guard let filteredImage = currentFilter?.outputImage else { return .init() }
        let outputImage = ciContext.createCGImage(filteredImage, from: filteredImage.extent)
        imageView.image = .init(cgImage: outputImage!)
        return imageView
    }
}
