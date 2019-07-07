//
//  ShadowView.swift
//  breakPoint
//
//  Created by AHMED on 2/2/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class ShadowView: UIView {
  
  override func awakeFromNib() {
    self.layer.shadowOpacity = 0.75
    self.layer.shadowRadius = 5
    self.layer.shadowColor = UIColor.black.cgColor
    super.awakeFromNib()
  }

}
