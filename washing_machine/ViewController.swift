//
//  ViewController.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 8/11/22.
//

import UIKit
//33 35 41 //cylynder 54 57 62
class ViewController: UIViewController {
    lazy var timeContainer: UIView = self.makeContainer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 33.0/255.0, green: 35.0/255.0, blue: 41.0/255.0, alpha: 1.0)
    }
    
}

extension ViewController {
    func makeContainer() -> UIView {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        return temp
    }
}
