//
//  DetectDeviesViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit

class DetectDeviesViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detectDevices()
        imgView.image = #imageLiteral(resourceName: "WhatsApp_Png.png") // Whatsapp Logo Png
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            imgView.image = #imageLiteral(resourceName: "WhatsApp.png") // Whatsapp Logo Fill
        } else {
            imgView.image = #imageLiteral(resourceName: "WhatsApp_Png.png") // Whatsapp Logo Png
        }
    }
    
    func detectDevices() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2796 :
                print("Iphone 15 pro max")
                imgView.layer.borderWidth = 3
                imgView.layer.borderColor = UIColor.red.cgColor
            case 2556 :
                print("Iphone 15 pro")
                imgView.layer.borderWidth = 2
                imgView.layer.borderColor = UIColor.systemPink.cgColor
            case 1792 :
                print("Iphone XR")
                imgView.layer.borderWidth = 5
                imgView.layer.borderColor = UIColor.blue.cgColor
            case 1334 :
                print("Iphone SE")
                imgView.layer.borderWidth = 1
                imgView.layer.borderColor = UIColor.systemCyan.cgColor
            default:
                print("Unknown")
            }
        }
    }


}
