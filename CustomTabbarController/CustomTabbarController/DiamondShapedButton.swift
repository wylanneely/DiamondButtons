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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
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
    
    
}

