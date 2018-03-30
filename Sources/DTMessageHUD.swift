//
//  DTMessageHUD.swift
//  DTMessageHUD
//
//  Created by Dan Jiang on 2016/11/8.
//
//

import UIKit

public protocol DTMessageHUDTheme {
  var hudForegoundColor: UIColor { get }
  var hudBackgroundColor: UIColor { get }
  var successForegoundColor: UIColor { get }
  var successBackgroundColor: UIColor { get }
  var infoForegoundColor: UIColor { get }
  var infoBackgroundColor: UIColor { get }
  var warningForegoundColor: UIColor { get }
  var warningBackgroundColor: UIColor { get }
  var errorForegoundColor: UIColor { get }
  var errorBackgroundColor: UIColor { get }
  var customForegoundColor: UIColor { get }
  var customBackgroundColor: UIColor { get }
}

public extension DTMessageHUDTheme {
  
    var hudForegoundColor: UIColor {
      return UIColor.black
    }
    
    var hudBackgroundColor: UIColor {
      return UIColor.white
    }
    
    var successForegoundColor: UIColor {
      return UIColor.black
    }
    
    var successBackgroundColor: UIColor {
      return UIColor.white
    }
    
    var infoForegoundColor: UIColor {
      return UIColor.black
    }
    
    var infoBackgroundColor: UIColor {
      return UIColor.white
    }

    var warningForegoundColor: UIColor {
      return UIColor.black
    }
    
    var warningBackgroundColor: UIColor {
      return UIColor.white
    }

    var errorForegoundColor: UIColor {
      return UIColor.black
    }
    
    var errorBackgroundColor: UIColor {
      return UIColor.white
    }
    
    var customForegoundColor: UIColor {
      return UIColor.black
    }
    
    var customBackgroundColor: UIColor {
      return UIColor.white
    }

}

public class DTMessageHUD: UIView {

  public struct LightTheme: DTMessageHUDTheme {
    
    public init() {}
    
  }
  
  public struct DarkTheme: DTMessageHUDTheme {
    
    public init() {}

    public var hudForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var hudBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
    public var successForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var successBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
    public var infoForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var infoBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
    public var warningForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var warningBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
    public var errorForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var errorBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
    public var customForegoundColor: UIColor {
      return UIColor.white
    }
    
    public var customBackgroundColor: UIColor {
      return UIColor(red:0.11, green:0.11, blue:0.15, alpha:0.8)
    }
    
  }
  
  public struct ColorfulTheme: DTMessageHUDTheme {
   
    public init() {}
    
    public var hudForegoundColor: UIColor {
      return UIColor(red:0.45, green:0.36, blue:0.63, alpha:1.00)
    }
    
    public var successForegoundColor: UIColor {
      return UIColor(red:0.24, green:0.46, blue:0.24, alpha:1.00)
    }
    
    public var successBackgroundColor: UIColor {
      return UIColor(red:0.87, green:0.94, blue:0.85, alpha:1.00)
    }
    
    public var infoForegoundColor: UIColor {
      return UIColor(red:0.19, green:0.44, blue:0.56, alpha:1.00)
    }
    
    public var infoBackgroundColor: UIColor {
      return UIColor(red:0.85, green:0.93, blue:0.97, alpha:1.00)
    }
    
    public var warningForegoundColor: UIColor {
      return UIColor(red:0.54, green:0.42, blue:0.23, alpha:1.00)
    }
    
    public var warningBackgroundColor: UIColor {
      return UIColor(red:0.99, green:0.97, blue:0.89, alpha:1.00)
    }
    
    public var errorForegoundColor: UIColor {
      return UIColor(red:0.66, green:0.27, blue:0.26, alpha:1.00)
    }
    
    public var errorBackgroundColor: UIColor {
      return UIColor(red:0.95, green:0.87, blue:0.87, alpha:1.00)
    }
    
    public var customForegoundColor: UIColor {
      return UIColor(red:0.45, green:0.36, blue:0.63, alpha:1.00)
    }

  }
  
  public static var theme: DTMessageHUDTheme = LightTheme()
  
  public enum Style {
    case hud
    case success
    case info
    case warning
    case error
    case custom
  }
  
  private static let sharedView = DTMessageHUD()
  private static let indicatorView = IndicatorView()
  
  @objc public func hide() {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      self.alpha = 0
    }, completion: { _ in
      self.removeFromSuperview()
    })
  }
  
  public class func hud(inView view: UIView? = nil) {
    show(inView: view, style: .hud)
  }

  public class func success(inView view: UIView? = nil) {
    show(inView: view, style: .success)
  }
  
  public class func info(inView view: UIView? = nil) {
    show(inView: view, style: .info)
  }

  public class func warning(inView view: UIView? = nil) {
    show(inView: view, style: .warning)
  }

  public class func error(inView view: UIView? = nil) {
    show(inView: view, style: .error)
  }
  
  public class func custom(image: UIImage, inView view: UIView? = nil) {
    show(inView: view, style: .custom, image: image)
  }
  
  public class func dismiss(inView view: UIView? = nil) {
    if let view = view {
      messageView(inView: view)?.hide()
    } else {
      DTMessageHUD.sharedView.hide()
    }
  }
  
  private class func messageView(inView view: UIView) -> DTMessageHUD? {
    for subview in view.subviews.reversed() {
      if subview.isKind(of: DTMessageHUD.self) {
        return subview as? DTMessageHUD
      }
    }
    return nil
  }
  
  public class func imageWithName(_ name: String) -> UIImage? {
    let bundle = Bundle(for: DTMessageHUD.self)
    let url = bundle.url(forResource: "DTMessageHUD", withExtension: "bundle")!
    let imageBundle = Bundle(url: url)
    return UIImage(named: name, in: imageBundle, compatibleWith: nil)
  }
  
  private class func show(inView view: UIView?, style: Style, image: UIImage? = nil) {
    if let view = view {
      let messageView = DTMessageHUD()
      let indicatorView = IndicatorView()
      show(inView: view, messageView: messageView,
           indicatorView: indicatorView, style: style, image: image)
    } else if let w = UIApplication.shared.delegate?.window, let window = w {
      show(inView: window, messageView: DTMessageHUD.sharedView,
           indicatorView: DTMessageHUD.indicatorView, style: style, image: image)
    }
  }
  
  private class func show(inView view: UIView, messageView: DTMessageHUD,
                          indicatorView: IndicatorView, style: Style, image: UIImage?) {
    if let _ = messageView.superview {
      return
    }
    
    indicatorView.customize(style: style, image: image)
    
    messageView.frame = view.bounds
    indicatorView.center = CGPoint(x: view.bounds.width / 2.0, y: view.bounds.height / 2.0)
    view.addSubview(messageView)
    messageView.addSubview(indicatorView)
    
    messageView.alpha = 0
    
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      messageView.alpha = 1
    }, completion: { finished in
      if style != .hud {
        Timer.scheduledTimer(timeInterval: 2, target: messageView, selector: #selector(hide), userInfo: nil, repeats: false)
      }
    })
  }
  
}

private class IndicatorView: UIView {
  
  private static let defaultWidth: CGFloat = 100
  private static let defaultHeight: CGFloat = 100
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: IndicatorView.defaultWidth, height: IndicatorView.defaultHeight))
    
    layer.cornerRadius = 10
  }
  
  func customize(style: DTMessageHUD.Style, image: UIImage?) {
    subviews.forEach { $0.removeFromSuperview() }
    
    if style == .hud {
      backgroundColor = DTMessageHUD.theme.hudBackgroundColor
      let loadingView = DTCircularLoadingView(frame: CGRect(x: 0, y: 0, width: IndicatorView.defaultWidth, height: IndicatorView.defaultHeight),
                                              insetX: 20,
                                              insetY: 20,
                                              lineWidth: 4,
                                              strokeColor: DTMessageHUD.theme.hudForegoundColor)
      addSubview(loadingView)
      loadingView.startAnimation()
    } else {
      var foregoundColor: UIColor
      var backgroundColor: UIColor
      var imageName: String
      switch style {
      case .success:
        foregoundColor = DTMessageHUD.theme.successForegoundColor
        backgroundColor = DTMessageHUD.theme.successBackgroundColor
        imageName = "success"
      case .info:
        foregoundColor = DTMessageHUD.theme.infoForegoundColor
        backgroundColor = DTMessageHUD.theme.infoBackgroundColor
        imageName = "info"
      case .warning:
        foregoundColor = DTMessageHUD.theme.warningForegoundColor
        backgroundColor = DTMessageHUD.theme.warningBackgroundColor
        imageName = "warning"
      case .error:
        foregoundColor = DTMessageHUD.theme.errorForegoundColor
        backgroundColor = DTMessageHUD.theme.errorBackgroundColor
        imageName = "error"
      default:
        foregoundColor = DTMessageHUD.theme.customForegoundColor
        backgroundColor = DTMessageHUD.theme.customBackgroundColor
        imageName = ""
      }
      
      self.backgroundColor = backgroundColor
      var img: UIImage?
      if let image = image {
        img = image
      } else {
        img = DTMessageHUD.imageWithName(imageName)
      }
      let imageView = UIImageView(image: img?.withRenderingMode(.alwaysTemplate))
      imageView.tintColor = foregoundColor
      imageView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
      addSubview(imageView)
    }
  }

}
