//
//  ZKButton.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

final class ZKButton: UIButton {
  
  let borderWidth: CGFloat = 2
  let borderColor = UIColor(named: ZKColor.button.rawValue) ?? .systemBlue
  let cornerRadius: CGFloat = 5

  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureBorder()
  }
  
  
  private func configureBorder() {
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor.cgColor
    layer.cornerRadius = cornerRadius
  }
  
}
