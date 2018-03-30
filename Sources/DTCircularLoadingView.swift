//
//  DTCircularLoadingView.swift
//  DTMessageHUD
//
//  Created by Dan Jiang on 2016/11/9.
//
//

import UIKit

public class DTCircularLoadingView: UIView {
  
  private var animatedLayer: CAShapeLayer?
  private var insetX: CGFloat
  private var insetY: CGFloat
  private var lineWidth: CGFloat
  private var strokeColor: UIColor
  
  private let rotationKey = "rotation"
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public init(frame: CGRect, insetX: CGFloat, insetY: CGFloat, lineWidth: CGFloat, strokeColor: UIColor) {
    self.insetX = insetX
    self.insetY = insetY
    self.lineWidth = lineWidth
    self.strokeColor = strokeColor
    super.init(frame: frame)
  }
  
  public override func willMove(toSuperview newSuperview: UIView?) {
    if let _ = newSuperview {
      if let animatedLayer = animatedLayer {
        layer.addSublayer(animatedLayer)
      } else {
        let animatedLayer = makeAnimatedLayer()
        self.animatedLayer = animatedLayer
        layer.addSublayer(animatedLayer)
      }
    } else {
      animatedLayer?.removeFromSuperlayer()
    }
  }
  
  public var isAnimating :Bool {
    if let _ = animatedLayer?.mask?.animation(forKey: rotationKey) {
      return true
    } else {
      return false
    }
  }
  
  public func startAnimation() {
    let rotation = CABasicAnimation(keyPath: "transform.rotation")
    rotation.fromValue = 0
    rotation.toValue = Double.pi * 2
    rotation.duration = 1
    rotation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    rotation.isRemovedOnCompletion = false
    rotation.repeatCount = Float.infinity
    rotation.fillMode = kCAFillModeForwards
    rotation.autoreverses = false
    
    animatedLayer?.mask?.add(rotation, forKey: rotationKey)
  }
  
  public func stopAnimation() {
    animatedLayer?.mask?.removeAnimation(forKey: rotationKey)
  }
  
  // MARK: - Private
  
  private func makeAnimatedLayer() -> CAShapeLayer {
    let path = UIBezierPath(ovalIn: frame.insetBy(dx: insetX, dy: insetY))
    
    let animatedLayer = CAShapeLayer()
    animatedLayer.frame = frame
    animatedLayer.fillColor = UIColor.clear.cgColor
    animatedLayer.strokeColor = strokeColor.cgColor
    animatedLayer.lineWidth = lineWidth
    animatedLayer.path = path.cgPath
    
    let maskLayer = CALayer()
    maskLayer.contents = DTMessageHUD.imageWithName("angle-mask")?.cgImage
    maskLayer.frame = frame
    
    animatedLayer.mask = maskLayer

    return animatedLayer
  }
  
}
