//
//  DTCircularLoadingView.swift
//  DTMessageHUD
//
//  Created by Dan Jiang on 2016/11/9.
//
//

import UIKit

class DTCircularLoadingView: UIView {
  
  fileprivate var animatedLayer: CAShapeLayer?
  fileprivate var strokeColor: UIColor
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(frame: CGRect, strokeColor: UIColor) {
    self.strokeColor = strokeColor
    super.init(frame: frame)
  }
  
  override func willMove(toSuperview newSuperview: UIView?) {
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
  
  // MARK: - Private
  
  fileprivate func makeAnimatedLayer() -> CAShapeLayer {
    let path = UIBezierPath(ovalIn: frame.insetBy(dx: 20, dy: 20))
    
    let animatedLayer = CAShapeLayer()
    animatedLayer.frame = frame
    animatedLayer.fillColor = UIColor.clear.cgColor
    animatedLayer.strokeColor = strokeColor.cgColor
    animatedLayer.lineWidth = 4
    animatedLayer.path = path.cgPath
    
    let maskLayer = CALayer()
    maskLayer.contents = imageWithName("angle-mask")?.cgImage
    maskLayer.frame = frame
    
    let rotation = CABasicAnimation(keyPath: "transform.rotation")
    rotation.fromValue = 0
    rotation.toValue = Double.pi * 2
    rotation.duration = 1
    rotation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    rotation.isRemovedOnCompletion = false
    rotation.repeatCount = Float.infinity
    rotation.fillMode = kCAFillModeForwards
    rotation.autoreverses = false
    
    maskLayer.add(rotation, forKey: "rotation")
    
    animatedLayer.mask = maskLayer

    return animatedLayer
  }
  
  fileprivate func imageWithName(_ name: String) -> UIImage? {
    let bundle = Bundle(for: DTCircularLoadingView.self)
    return UIImage(named: name, in: bundle, compatibleWith: nil)
  }
  
}
