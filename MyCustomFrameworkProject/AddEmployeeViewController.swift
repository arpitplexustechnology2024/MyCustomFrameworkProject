//
//  AddEmployeeViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit

class AddEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showAlert(_ sender: Any) {
        showAlert()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Employee name", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField { textfield in
            textfield.placeholder = "please enter first name"
        }
        alert.addTextField { textfield in
            textfield.placeholder = "please enter last name"
        }
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { action in
            if let firstName = alert.textFields?[0].text {
                print("firstname: \(firstName)")
            }
            if let lastName = alert.textFields?[1].text {
                print("lastname: \(lastName)")
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
