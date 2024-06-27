//
//  PhoneCallViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit

class PhoneCallViewController: UIViewController {
    
    fileprivate let application = UIApplication.shared

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSetting(_ sender: UIButton) {
        if let settingURL = URL(string: UIApplication.openSettingsURLString) {
                application.open(settingURL, options: [:]) { _ in
                    // action
            }
        }
    }
    
    @IBAction func btnPhoneCall(_ sender: UIButton) {
        if let phoneURL = URL(string: "tel://7874718104") {
           if application.canOpenURL(phoneURL) {
               application.open(phoneURL, options: [:], completionHandler: nil)
           } else {
               let alert = UIAlertController(title: "Error!", message: "Real Device to application run.!", preferredStyle: .alert)
               let alertAction = UIAlertAction(title: "Ok", style: .default)
               alert.addAction(alertAction)
               present(alert, animated: true)
           }
        }
    }
    
}
