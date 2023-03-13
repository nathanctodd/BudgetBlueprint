//
//  CircularProgress.swift
//  BudgetBlueprint
//
//  Created by Nathan Todd on 12/23/21.
//

import UIKit

class CircularProgress: UIView {

    fileprivate var progressLayer = CAShapeLayer()
    fileprivate var trackLayer = CAShapeLayer()
    
    
    init(frame: CGRect, width: Double) {
        super.init(frame: frame)
        createCircularPath(width: width)
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath(width: 15.0)
    }
    
    
    var progressColor: UIColor = UIColor(red: 90/255, green: 165/255, blue: 253/255, alpha: 1.0) {
        didSet{
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor: UIColor = UIColor.white {
        didSet{

            trackLayer.strokeColor = trackColor.cgColor
        }
    }

    
    fileprivate func createCircularPath(width: Double) {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.width / 2.0
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 3, y: frame.size.height / 2), radius: (frame.size.width - 1.5) / 2, startAngle: CGFloat(-0.5 * Double.pi), endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
        
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = width;
        trackLayer.strokeEnd = 1.0
        trackLayer.cornerRadius = width / 2.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = width;
        progressLayer.strokeEnd = 0.0
        progressLayer.cornerRadius = width / 2.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateCircle")
        
    }
    
    
    
    
    
}
