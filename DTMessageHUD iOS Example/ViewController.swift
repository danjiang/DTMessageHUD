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

  @IBAction func dark(_ sender: UIButton) {
    DTMessageHUD.setStyle(.dark)
    show()
  }

  @IBAction func light(_ sender: UIButton) {
    DTMessageHUD.setStyle(.light)
    show()
  }
  
  fileprivate func show() {
    DTMessageHUD.show()
    Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { _ in
      DTMessageHUD.dismiss()
    })
  }
  
}

