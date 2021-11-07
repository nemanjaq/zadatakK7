//
//  PersonInfoVC.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

protocol PersonInfoVCDelegate: class {
  func didUpdatePerson(_ person: Person, at indexPath: IndexPath)
}


final class PersonInfoVC: UIViewController {
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var lastNameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!
  @IBOutlet var genderLabel: UILabel!
  
  weak var delegate: PersonInfoVCDelegate?
  
  private let namePrefix = "Name: "
  private let lastNamePrefix = "Last Name: "
  private let agePrefix = "Age: "
  private let genderPrefix = "Gender: "
  
  private let maxAge = 100
  private let minAge = 0
  private let ageIncrement = 1
  
  var person: Person!
  var indexPath: IndexPath!
  
}


// MARK: - Configure

extension PersonInfoVC {
  
  // MARK: DidLoad
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureData(for: person)
  }
  
  private func configureData(for person: Person) {
    nameLabel.text = namePrefix + person.name
    lastNameLabel.text = lastNamePrefix + person.lastName
    updateAge()
    genderLabel.text = genderPrefix + person.gender.rawValue
  }
  
  private func updateAge() {
    ageLabel.text = agePrefix + "\(person.age)"
  }
  
}


// MARK: - Actions

extension PersonInfoVC {
  
  @IBAction func didPressButtonClose(_ sender: Any) {
    delegate?.didUpdatePerson(person, at: indexPath)
    dismiss(animated: true)
  }
  
  @IBAction func didPressButtonAddYear(_ sender: Any) {
    guard person.age < maxAge else { return }
    
    person.age += ageIncrement
    updateAge()
  }
  
  @IBAction func didPressButtonRemoveYear(_ sender: Any) {
    guard person.age > minAge else { return }
    
    person.age -= ageIncrement
    updateAge()
  }
  
}
