//
//  CustomTabbarViewController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/3/17.
//  Copyright © 2017 Wylan. All rights reserved.
//
import CoreGraphics
import UIKit

class CustomTabbarViewController: UIViewController {
    
//    let centerMarker = UIButton()

    let aButton = DiamondShapedButton()
    let bButton = DiamondShapedButton()
    let dButton = DiamondShapedButton()
    let cButton = DiamondShapedButton()
    let eButton = DiamondShapedButton()
    let fButton = DiamondShapedButton()
    let gButton = DiamondShapedButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        setupContraints()
    }
    
    
    func setUpButtons() {
        
        cButton.addTarget(self, action: #selector(cButtonTapped), for: .touchUpInside)
        
        view.addSubview(aButton)
        view.addSubview(bButton)
        view.addSubview(cButton)
        view.addSubview(dButton)
        view.addSubview(eButton)
        view.addSubview(fButton)
        view.addSubview(gButton)
        
//      view.addSubview(centerMarker)
        
        
    }
    
    func cButtonTapped() {
        
        
        
    }
    
    func setupContraints(){
        
//        centerMarker.translatesAutoresizingMaskIntoConstraints = false
//        
//        centerMarker.backgroundColor = .green
//        
//        centerMarker.transform = centerMarker.transform.rotated(by: CGFloat(1))
//
//        
//        let centerXC = NSLayoutConstraint(item: self.centerMarker, attribute: .centerX, relatedBy: .equal,
//                                                    toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
//        let centerYC = NSLayoutConstraint(item: self.centerMarker, attribute: .centerY, relatedBy: .equal,
//                                                    toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
//        self.view.addConstraints([centerXC,centerYC])
//        
//        
        
        aButton.translatesAutoresizingMaskIntoConstraints = false
        cButton.translatesAutoresizingMaskIntoConstraints = false
        dButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.translatesAutoresizingMaskIntoConstraints = false
        eButton.translatesAutoresizingMaskIntoConstraints = false
        fButton.translatesAutoresizingMaskIntoConstraints = false
        gButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Upper Left Button
        let aButtonXConstraint = NSLayoutConstraint(item: self.aButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 0.5, constant: 0)
        let aButtonYConstraint = NSLayoutConstraint(item: self.aButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.75, constant: 0)
        let aButtonHeight = NSLayoutConstraint(item: self.aButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let aButtonWidth = NSLayoutConstraint(item: self.aButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([aButtonXConstraint,aButtonYConstraint,aButtonHeight,aButtonWidth])
        
        // Upper Center Buttom
        let bButtonXConstraint = NSLayoutConstraint(item: self.bButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.1, constant: 0)
        let bButtonYConstraint = NSLayoutConstraint(item: self.bButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.43, constant: 0)
        let bButtonHeight = NSLayoutConstraint(item: self.bButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let bButtonWidth = NSLayoutConstraint(item: self.bButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        
        self.view.addConstraints([bButtonXConstraint,bButtonYConstraint,bButtonWidth,bButtonHeight])
        
        
        // Center Button
        let cButtonXConstraint = NSLayoutConstraint(item: self.cButton, attribute: .centerX, relatedBy: .equal,
                                                   toItem: self.view, attribute: .centerX, multiplier: 1.1, constant: 0)
        let cButtonYConstraint = NSLayoutConstraint(item: self.cButton, attribute: .centerY, relatedBy: .equal,
                                                   toItem: self.view, attribute: .centerY, multiplier: 0.9, constant: 0)
        let cButtonHeight = NSLayoutConstraint(item: self.cButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let cButtonWidth = NSLayoutConstraint(item: self.cButton, attribute: .width, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
            
        self.view.addConstraints([cButtonXConstraint,cButtonYConstraint,cButtonHeight,cButtonWidth])

        
        // Upper Right Button
        let dButtonXConstraint = NSLayoutConstraint(item: self.dButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.65, constant: 0)
        let dButtonYConstraint = NSLayoutConstraint(item: self.dButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 0.75, constant: 0)
        let dButtonHeight = NSLayoutConstraint(item: self.dButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let dButtonWidth = NSLayoutConstraint(item: self.dButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([dButtonXConstraint,dButtonYConstraint,dButtonWidth,dButtonHeight])
    
        
        // Bottom Left Button
        let eButtonXConstraint = NSLayoutConstraint(item: self.eButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 0.5, constant: 0)
        let eButtonYConstraint = NSLayoutConstraint(item: self.eButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.13, constant: 0)
        let eButtonHeight = NSLayoutConstraint(item: self.eButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let eButtonWidth = NSLayoutConstraint(item: self.eButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([eButtonXConstraint,eButtonYConstraint,eButtonHeight,eButtonWidth])
        
        
        // Bottom Center Button
        let fButtonXConstraint = NSLayoutConstraint(item: self.fButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.1, constant: 0)
        let fButtonYConstraint = NSLayoutConstraint(item: self.fButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.4, constant: 0)
        let fButtonHeight = NSLayoutConstraint(item: self.fButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let fButtonWidth = NSLayoutConstraint(item: self.fButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([fButtonXConstraint,fButtonYConstraint,fButtonWidth,fButtonHeight])
        
        
        // Bottom Right Button
        let gButtonXConstraint = NSLayoutConstraint(item: self.gButton, attribute: .centerX, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerX, multiplier: 1.65, constant: 0)
        let gButtonYConstraint = NSLayoutConstraint(item: self.gButton, attribute: .centerY, relatedBy: .equal,
                                                    toItem: self.view, attribute: .centerY, multiplier: 1.13, constant: 0)
        let gButtonHeight = NSLayoutConstraint(item: self.gButton, attribute: .height, relatedBy: .equal,
                                               toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        let gButtonWidth = NSLayoutConstraint(item: self.gButton, attribute: .width, relatedBy: .equal,
                                              toItem: self.view, attribute: .height, multiplier: 1/8, constant: 0)
        self.view.addConstraints([gButtonXConstraint,gButtonYConstraint,gButtonWidth,gButtonHeight])
        
        
    }
    
}

class DiamondShapedButton: UIButton {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.green
        addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: 45, y: 0))
        path.addLine(to: CGPoint(x: 90,y: 45))
        path.addLine(to: CGPoint(x: 45,y: 90))
        path.addLine(to: CGPoint(x: 0,y: 45))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
        
    }
    
    
    func touchDown(button: DiamondShapedButton, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)
            
            if path.contains(location) == false {
                button.cancelTracking(with: nil)
                print("TestingOutside")

            }
            if path.contains(location) == true {
                button.cancelTracking(with: nil)
                print("TestingInside")
                
            }
        }

        
    }
}
