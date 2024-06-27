//
//  WebViewViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://www.apple.com/in/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
