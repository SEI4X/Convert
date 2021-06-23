//
//  ImageExtensions.swift
//  Convert
//
//  Created by Alexei Mashkov on 22.06.2021.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
