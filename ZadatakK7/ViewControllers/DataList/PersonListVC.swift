//
//  PersonListVC.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit

final class PersonListVC: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  private let seguePersonInfoKey = "segueToPersonInfo"
  private let rowHeight: CGFloat = 50
  
  var persons: [Person] = PersonMock.randomPersons(count: 10)
  
}


// MARK: - Configure

extension PersonListVC {
  
  // MARK: Did Load
  
  override func viewDidLoad() {
    super.viewDidLoad()
    styleNavigationBar()
  }
  
  private func styleNavigationBar() {
    navigationController?.setNavigationBarHidden(false, animated: false)
    
    let image = ZKIcons.back.styled
    navigationController?.navigationBar.tintColor = .black
    navigationController?.navigationBar.backIndicatorImage = image
    navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
    navigationController?.navigationBar.backItem?.title = ""
  }
  
}


// MARK: - UITableViewDataSource

extension PersonListVC: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return persons.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ZKPersonCell.reuseID, for: indexPath) as! ZKPersonCell
    
    let person = persons[indexPath.row]
    cell.set(person: person)
    
    return cell
  }
  
}


// MARK: - UITableViewDelegate

extension PersonListVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: seguePersonInfoKey, sender: indexPath)
  }
  
}

// MARK: - PersonInfoVCDelegate

extension PersonListVC: PersonInfoVCDelegate {
  
  func didUpdatePerson(_ person: Person, at indexPath: IndexPath) {
    guard persons[indexPath.row].age != person.age else { return }
    
    persons[indexPath.row] = person
    tableView.reloadRows(at: [indexPath], with: .none)
    
    let cell = tableView.cellForRow(at: indexPath) as? ZKPersonCell
    cell?.didUpdate()
  }
  
}

// MARK: - Navigation

extension PersonListVC {
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == seguePersonInfoKey {
      guard let viewController = segue.destination as? PersonInfoVC else {
        print("Segue destination error!")
        return
      }
      guard let indexPath = sender as? IndexPath else {
        print("Sender object error: it should be indexPath!")
        return
      }
      let person = persons[indexPath.row]
      viewController.person = person
      viewController.indexPath = indexPath
      viewController.delegate = self
    }
  }
  
}

// MARK: - Actions

extension PersonListVC {
  
  @IBAction func didPressButtonRefreshTable(_ sender: Any) {
    tableView.reloadData()
  }
  
}
