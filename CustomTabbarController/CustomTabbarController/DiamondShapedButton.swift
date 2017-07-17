//
//  DiamondShapedButton.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/5/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import CoreGraphics

class DiamondShapedButton: UIButton {
    
    var soundController = SoundController()
    var path: UIBezierPath!
    //property to account for score counting
    var hasButtonBeenTapped: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Create the shape object to be defined the created using a BezierPath
        path = UIBezierPath()
        // Set up Path of Bezier
        path.move(to: CGPoint(x: 45, y: 0))
        path.addLine(to: CGPoint(x: 90,y: 45))
        path.addLine(to: CGPoint(x: 45,y: 90))
        path.addLine(to: CGPoint(x: 0,y: 45))
        path.close()
        // add a shape layer in the shape of the bezierpath to sublayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
    
}

