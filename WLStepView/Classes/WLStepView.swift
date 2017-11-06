//
//  WLStepView.swift
//  WLStepView
//
//  Created by Wai Lynn Zaw on 11/5/17.
//  Copyright © 2017 wailynnzaw. All rights reserved.
//

import UIKit

@IBDesignable
class WLStepView: UIView {
    
    @IBInspectable
    var lineWidth: CGFloat = 5.0
    
    @IBInspectable
    var color: UIColor = UIColor.blue
    
    @IBInspectable
    var circleRadius: CGFloat = 8.0
    
    @IBInspectable
    var numberOfPoints: Int = 3
    
    @IBInspectable
    var textFont: UIFont = UIFont.systemFont(ofSize: 12)
    
    enum TextPosition {
        case top
        case bottom
    }
    
    var delegate: WLStepViewDelegate?
    
    private func pathForLine() -> UIBezierPath {
        var startPoint: CGPoint {
            return CGPoint(x: bounds.minX + 16, y: bounds.midY)
        }
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: bounds.size.width * 0.95 , y: bounds.midY))
        path.lineWidth = lineWidth
        return path
    }
    
    private func pathForPoint(_ point: CGPoint) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: point, radius: circleRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        return path
    }
    
    func addLabel(_ rect: CGPoint, label: String){
        let attribute: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.foregroundColor: color,
            NSAttributedStringKey.font: textFont
        ]
        let text  = NSAttributedString(string: label, attributes: attribute)
        text.draw(at: rect)
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        pathForLine().stroke()
        
        let distanceBetweenCircles = (self.bounds.width * 0.95 - (CGFloat(numberOfPoints) * 2 * circleRadius)) / CGFloat(numberOfPoints - 1)
        
        var xCursor: CGFloat = circleRadius
        
        for i in 0...(numberOfPoints - 1) {
            let circlePoint = CGPoint(x: xCursor + 8, y: bounds.midY)
            let bottomLabelPoint = CGPoint(x: xCursor - 5, y: bounds.midY + 16)
            let topLabelPoint = CGPoint(x: xCursor - 2, y: bounds.midY - 24)
            
            pathForPoint(circlePoint).stroke()
            pathForPoint(circlePoint).fill()
            
            if let delegate = delegate {
                addLabel(topLabelPoint, label: delegate.stepView(i, .top))
                addLabel(bottomLabelPoint, label: delegate.stepView(i, .bottom))
            }
            
            xCursor += 2 * circleRadius + distanceBetweenCircles
        }
        
    }
}
protocol WLStepViewDelegate {
    func stepView(_ index: Int,_ position: WLStepView.TextPosition) -> String
}
