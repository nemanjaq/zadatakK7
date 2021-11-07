//
//  ZKIcons.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

enum ZKIcons: String {
  case back = "arrow.backward"
  case close = "xmark"
  
  
  var styled: UIImage? {
    let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
    let image = UIImage(systemName: rawValue, withConfiguration: config)
    return image
  }
  
}
