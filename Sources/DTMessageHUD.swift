//
//  DTMessageHUD.swift
//  DTMessageHUD
//
//  Created by Dan Jiang on 2016/11/8.
//
//

import UIKit

public enum DTMessageHUDStyle {
  case light
  case dark
}

public class DTMessageHUD: UIView {

  public var style: DTMessageHUDStyle = .light {
    didSet {
      if oldValue != style {
        customize()
      }
    }
  }
  
  fileprivate static let defaultWidth: CGFloat = 100
  fileprivate static let defaultHeight: CGFloat = 100
  
  fileprivate static let sharedView = DTMessageHUD(frame: CGRect(x: 0, y: 0, width: defaultWidth, height: defaultHeight))
  fileprivate static let overlayView = UIView()
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    layer.cornerRadius = 10
    
    customize()
  }
  
  public class func setStyle(_ style: DTMessageHUDStyle) {
    sharedView.style = style
  }
  
  public class func show() {
    if let w = UIApplication.shared.delegate?.window, let window = w {
      DTMessageHUD.sharedView.center = window.center
      window.addSubview(DTMessageHUD.sharedView)
      
      DTMessageHUD.overlayView.frame = window.frame
      window.insertSubview(DTMessageHUD.overlayView, belowSubview: DTMessageHUD.sharedView)
      
      DTMessageHUD.overlayView.alpha = 0
      DTMessageHUD.sharedView.alpha = 0
      
      UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: { 
        DTMessageHUD.overlayView.alpha = 1
        DTMessageHUD.sharedView.alpha = 1
      }, completion: nil)
    }
  }
  
  public class func dismiss() {
    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
      DTMessageHUD.overlayView.alpha = 0
      DTMessageHUD.sharedView.alpha = 0
    }, completion: { _ in
      DTMessageHUD.overlayView.removeFromSuperview()
      DTMessageHUD.sharedView.removeFromSuperview()
    })
  }

  // MAKR: - Private
  
  fileprivate func customize() {
    var strokeColor = UIColor()
    switch style {
    case .light:
      backgroundColor = UIColor.white
      strokeColor = UIColor.black
    case .dark:
      backgroundColor = UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
      strokeColor = UIColor.white
    }
    
    subviews.forEach { $0.removeFromSuperview() }
    
    let loadingView = DTCircularLoadingView(frame: CGRect(x: 0, y: 0, width: DTMessageHUD.defaultWidth, height: DTMessageHUD.defaultHeight), strokeColor: strokeColor)
    
    addSubview(loadingView)
  }


}
