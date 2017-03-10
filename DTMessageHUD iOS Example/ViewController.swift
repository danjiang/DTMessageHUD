//
//  ViewController.swift
//  DTMessageHUD iOS Example
//
//  Created by Dan Jiang on 2016/11/8.
//
//

import UIKit
import DTMessageHUD

class ViewController: UIViewController {
  
  @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var styleSegmentedControl: UISegmentedControl!
  @IBOutlet weak var startButton: UIButton!
  
  private let loadingView = DTCircularLoadingView(frame: CGRect(x: 0, y: 0, width: 40, height: 40),
                                          insetX: 3,
                                          insetY: 3,
                                          lineWidth: 6,
                                          strokeColor: UIColor.blue)

  override func loadView() {
    super.loadView()
    
    view.addSubview(loadingView)    
    
    loadingView.translatesAutoresizingMaskIntoConstraints = false

    let leading = NSLayoutConstraint(item: loadingView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20)
    let bottom = NSLayoutConstraint(item: loadingView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -20)
    let width = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 40)
    let height = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 40)
    
    loadingView.addConstraints([width, height])
    view.addConstraints([leading, bottom])
  }
  
  @IBAction func show(_ sender: Any) {
    switch themeSegmentedControl.selectedSegmentIndex {
      case 1:
        DTMessageHUD.theme = DTMessageHUD.DarkTheme()
      case 2:
        DTMessageHUD.theme = DTMessageHUD.ColorfulTheme()
      default:
        DTMessageHUD.theme = DTMessageHUD.LightTheme()
    }
    
    switch styleSegmentedControl.selectedSegmentIndex {
    case 1:
      DTMessageHUD.success()
    case 2:
      DTMessageHUD.info()
    case 3:
      DTMessageHUD.warning()
    case 4:
      DTMessageHUD.error()
    case 5:
      DTMessageHUD.custom(#imageLiteral(resourceName: "dollar"))
    default:
      DTMessageHUD.hud()
      Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
        DTMessageHUD.dismiss()
      })
    }
  }

  @IBAction func start(_ sender: UIButton) {
    if let title = startButton.title(for: .normal) {
      if title == "Start" {
        startButton.setTitle("Stop", for: .normal)
        loadingView.startAnimation()
      } else {
        startButton.setTitle("Start", for: .normal)
        loadingView.stopAnimation()
      }
    }
  }
  
}

