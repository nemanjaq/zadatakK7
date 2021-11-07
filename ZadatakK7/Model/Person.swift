//
//  Person.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import Foundation

struct Person {
  
  enum Gender: String {
    case male
    case female
  }
  
  var name: String
  var lastName: String
  var age: Int
  var gender: Gender
  
}
