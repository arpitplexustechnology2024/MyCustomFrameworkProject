//
//  ViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit
import MyCustomFramework

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = CustomView(frame: CGRect(x: 46.67, y: 270, width: 300, height: 300))
        self.view.addSubview(customView)
        
        customView.setBorderColor(to: .blue)
        customView.setBorderWidth(to: 2)
        customView.setCornerRadius(to: 25)
        customView.setBackgroundColor(to: .systemYellow)
        
    }


}

