//
//  ViewController.swift
//  PayAnimation
//
//  Created by baiaman apsamatov on 31/10/22.
//

import UIKit

class PaymentContentView: UIView {

    lazy var logoImageView: UIView = self.makeLogoImageView()
    lazy var subtractImage: UIImageView = self.makeSubtractImageView()
    lazy var dividerImageView: UIImageView = self.makeDividerImageView()
    lazy var topView: UIView = self.makeTopView()
    lazy var dividerView: UIView = self.makeDivider()
    lazy var bottomView: UIView = self.makeBottomView()
    lazy var bottomTopSummTitle: UILabel = self.makeLabel()
    lazy var bottomUnderTitle: UILabel = self.makeLabel()
    lazy var circleCheck: UIView = self.makeCircle()
    lazy var circleCheckImage: UIImageView = self.makeCheckMark()
    
    var paidConstraintX: NSLayoutConstraint?
    var paidTopConstraint: NSLayoutConstraint?
    
    var heightImageConstraint: NSLayoutConstraint?
    var widthImageConstraint: NSLayoutConstraint?
    var centerXImageContraint: NSLayoutConstraint?
    var topImageConstraint: NSLayoutConstraint?
    var bottomImageConstraint: NSLayoutConstraint?
    
    var trailingImageConstraint: NSLayoutConstraint?
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)
        setSubviews()
        setConstraints()
        
        self.bottomTopSummTitle.text = "500,87 c"
        self.bottomTopSummTitle.textColor = .black

        self.bottomUnderTitle.text = "Оплачено"
        self.bottomUnderTitle.textColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSubviews() {
        self.addSubview(self.topView)
        self.topView.addSubview(self.subtractImage)

        self.addSubview(self.dividerView)
        self.dividerView.addSubview(self.dividerImageView)
        self.addSubview(self.logoImageView)
        self.addSubview(self.bottomView)
        self.bottomView.addSubview(self.circleCheck)
        self.bottomView.addSubview(self.bottomUnderTitle)
        self.bottomView.addSubview(self.bottomTopSummTitle)
        self.circleCheck.addSubview(self.circleCheckImage)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 72.0),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 72.0),
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100.0),
            
            self.topView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24.0),
            self.topView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24.0),
            self.topView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.topView.heightAnchor.constraint(equalToConstant: 100.0),
            self.topView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: -28.0),
            
            self.subtractImage.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor),
            self.subtractImage.trailingAnchor.constraint(equalTo: self.topView.trailingAnchor),
            self.subtractImage.topAnchor.constraint(equalTo: self.topView.topAnchor),
            self.subtractImage.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor),
            
            self.dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24.0),
            self.dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24.0),
            self.dividerView.topAnchor.constraint(equalTo: self.topView.bottomAnchor),
            
            self.dividerImageView.leadingAnchor.constraint(equalTo: self.dividerView.leadingAnchor),
            self.dividerImageView.trailingAnchor.constraint(equalTo: self.dividerView.trailingAnchor),
            self.dividerImageView.topAnchor.constraint(equalTo: self.subtractImage.bottomAnchor),
            self.dividerImageView.bottomAnchor.constraint(equalTo: self.dividerView.bottomAnchor),
            self.dividerImageView.heightAnchor.constraint(equalToConstant: 40.0),
            
            self.bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24.0),
            self.bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24.0),
            self.bottomView.topAnchor.constraint(equalTo: self.dividerImageView.bottomAnchor),
            
            self.bottomTopSummTitle.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor),
            self.bottomTopSummTitle.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 16.0),
            
            self.circleCheckImage.leadingAnchor.constraint(equalTo: self.circleCheck.leadingAnchor, constant: 0.0),
            self.circleCheckImage.trailingAnchor.constraint(equalTo: self.circleCheck.trailingAnchor, constant: 0.0),
            self.circleCheckImage.topAnchor.constraint(equalTo: self.circleCheck.topAnchor, constant: 0.0),
            self.circleCheckImage.bottomAnchor.constraint(equalTo: self.circleCheck.bottomAnchor, constant: 0.0)
        ])
        
        self.paidConstraintX = self.bottomUnderTitle.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor, constant: 0.0)
        self.paidConstraintX?.isActive = true
        
        self.paidTopConstraint = self.bottomUnderTitle.topAnchor.constraint(equalTo: self.bottomTopSummTitle.bottomAnchor, constant: 12.0)
        self.paidTopConstraint?.isActive = true
        
        self.widthImageConstraint = self.circleCheck.widthAnchor.constraint(equalToConstant: 92.0)
        self.widthImageConstraint?.isActive = true
        self.heightImageConstraint = self.circleCheck.heightAnchor.constraint(equalToConstant: 92.0)
        self.heightImageConstraint?.isActive = true
        self.centerXImageContraint = self.circleCheck.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor)
        self.centerXImageContraint?.isActive = true
        self.topImageConstraint = self.circleCheck.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 86.0)
        self.topImageConstraint?.isActive = true
        self.bottomImageConstraint = self.circleCheck.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -44.0)
        self.bottomImageConstraint?.isActive = true
        
        self.trailingImageConstraint = self.circleCheck.trailingAnchor.constraint(equalTo: self.bottomUnderTitle.leadingAnchor, constant: 0)
        self.trailingImageConstraint?.isActive = false
    }
}

extension PaymentContentView {
    
    func makeCheckMark() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "check")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }
    
    func makeLogoImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }
    
    func makeDividerImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "divider")
        image.contentMode = .scaleToFill
        return image
    }
    
    func makeTopView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }
    
    func makeDivider() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }
    
    func makeSubtractImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "subtract")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        return view
    }
    
    func makeBottomView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24.0
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }
    
    func makeCircle() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }
    
    func makeContainer() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = . yellow
        return view
    }
    func makePayButtons() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }
}
