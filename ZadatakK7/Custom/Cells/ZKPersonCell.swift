//
//  ZKPersonCell.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

final class ZKPersonCell: UITableViewCell {
  
  @IBOutlet var containerView: UIView!
  @IBOutlet var titleLabel: UILabel!
  
  static let reuseID = "ZKPersonCell"
  
  let borderWidth: CGFloat = 2
  let borderColor = UIColor.systemGray2
  
  override func awakeFromNib() {
    super.awakeFromNib()
    configureBorder()
  }
  
}

// MARK: - Configure

extension ZKPersonCell {
  
  func configureBorder() {
    layer.borderWidth = borderWidth
    layer.borderColor = borderColor.cgColor
  }
  
}

// MARK: - Updates

extension ZKPersonCell {
  
  func set(person: Person) {
    titleLabel.text = "\(person.name) \(person.lastName), \(person.age)"
  }
  
  
  func didUpdate() {
    // animate highlight
    let color = containerView.backgroundColor
    containerView.backgroundColor = .systemGreen
    UIView.animate(withDuration: 1) {
      self.containerView.backgroundColor = color
    }
  }
  
}
