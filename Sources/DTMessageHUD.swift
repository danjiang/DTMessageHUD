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
  }
  
  public class func hud() {
    show(style: .hud)
  }
  
  public class func success() {
    show(style: .success)
  }
  
  public class func info() {
    show(style: .info)
  }

  public class func warning() {
    show(style: .warning)
  }

  public class func error() {
    show(style: .error)
  }
  
  public class func custom(_ image: UIImage) {
    show(style: .custom, image: image)
  }
  
  public class func dismiss() {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
      DTMessageHUD.overlayView.alpha = 0
      DTMessageHUD.sharedView.alpha = 0
    }, completion: { _ in
      DTMessageHUD.overlayView.removeFromSuperview()
      DTMessageHUD.sharedView.removeFromSuperview()
    })
  }
  
  func autoDismiss() {
    DTMessageHUD.dismiss()
  }
  
  public static func imageWithName(_ name: String) -> UIImage? {
    let bundle = Bundle(for: DTMessageHUD.self)
    let url = bundle.url(forResource: "DTMessageHUD", withExtension: "bundle")!
    let imageBundle = Bundle(url: url)
    return UIImage(named: name, in: imageBundle, compatibleWith: nil)
  }
  
  fileprivate class func show(style: Style, image: UIImage? = nil) {
    if let _ = DTMessageHUD.sharedView.superview {
      return
    }
    
    if let w = UIApplication.shared.delegate?.window, let window = w {
      DTMessageHUD.sharedView.customize(style: style, image: image)
      
      DTMessageHUD.sharedView.center = window.center
      window.addSubview(DTMessageHUD.sharedView)
      
      if style == .hud {
        DTMessageHUD.overlayView.frame = window.frame
        window.insertSubview(DTMessageHUD.overlayView, belowSubview: DTMessageHUD.sharedView)
      }
      
      DTMessageHUD.overlayView.alpha = 0
      DTMessageHUD.sharedView.alpha = 0
      
      UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
        DTMessageHUD.overlayView.alpha = 1
        DTMessageHUD.sharedView.alpha = 1
      }, completion: { finished in
        if style != .hud {
          Timer.scheduledTimer(timeInterval: 2, target: DTMessageHUD.sharedView, selector: #selector(autoDismiss), userInfo: nil, repeats: false)
        }
      })
    }
  }
  
  // MAKR: - Private
  
  fileprivate func customize(style: Style, image: UIImage?) {
    subviews.forEach { $0.removeFromSuperview() }

    if style == .hud {
      backgroundColor = DTMessageHUD.theme.hudBackgroundColor
      let loadingView = DTCircularLoadingView(frame: CGRect(x: 0, y: 0, width: DTMessageHUD.defaultWidth, height: DTMessageHUD.defaultHeight),
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
