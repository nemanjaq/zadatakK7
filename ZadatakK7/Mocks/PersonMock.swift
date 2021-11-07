//
//  PersonMock.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import Foundation

struct PersonMock {
  
  static let maleNames = ["Pera", "Mika", "Laza", "Zika"]
  static let femaleNames = ["Ana", "Mia", "Tea", "Lea"]
  static let lastNames = ["Peric", "Mikic", "Lazic", "Zikic"]
  static let age = 0..<100
  
  
  static func randomPersons(count: Int) -> [Person] {
    var persons: [Person] = []
    persons.append(contentsOf: randomMales(count: count / 2))
    persons.append(contentsOf: randomFemales(count: count / 2))
    return persons
  }
  
  
  static func randomMales(count: Int) -> [Person] {
    (0..<count).map { i -> Person in
      Person(
        name: maleNames.randomElement()!,
        lastName: lastNames.randomElement()!,
        age: age.randomElement()!,
        gender: .male
      )
    }
  }
  
  
  static func randomFemales(count: Int) -> [Person] {
    (0..<count).map { i -> Person in
      Person(
        name: femaleNames.randomElement()!,
        lastName: lastNames.randomElement()!,
        age: age.randomElement()!,
        gender: .female
      )
    }
  }
  
}
