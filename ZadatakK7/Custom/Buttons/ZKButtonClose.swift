//
//  ZKButtonClose.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

final class ZKButtonClose: UIButton {
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureImage()
  }
  
  
  private func configureImage() {
    setTitle("", for: .normal)
    setImage(ZKIcons.close.styled, for: .normal)
    tintColor = .black
  }
    
}
