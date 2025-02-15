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
    lazy var contenView: WashingMachineContentView = self.makeWachingMachineContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 33.0/255.0, green: 35.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        self.view.addSubview(self.contenView)
        self.setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.contenView.setInitialLocaltionsDirtyClothes()
        self.contenView.setupBehaviours()
        self.perform(#selector(self.changeVortexStrengh), with: nil, afterDelay: 5.0)
    }
    
    @objc func changeVortexStrengh() {
        self.contenView.startDrumAnimation(duration: 2.0, count: 3.0)
        self.perform(#selector(self.enhanceVortexStrengh), with: nil, afterDelay: 6)
    }
    
    @objc func enhanceVortexStrengh() {
        self.contenView.rotateAnimation(durationRotate: 0.5, count: 20.0)
        self.contenView.vortextBehaviour.strength = -0.1
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.contenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contenView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.contenView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.contenView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController {
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
