//
//  WenScrapingViewController.swift
//  MyCustomFrameworkProject
//
//  Created by Arpit iOS Dev. on 27/06/24.
//

import UIKit
import SwiftSoup

class WenScrapingViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        fetchHTML(from: "https://www.wikipedia.org") { htmlString in
            guard let htmlString = htmlString else {
                self.updateUI(title: "Failed to fetch HTML", body: "")
                return
            }

            self.parseHTML(html: htmlString)
        }
    }

    func fetchHTML(from urlString: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let htmlString = String(data: data, encoding: .utf8)
            completion(htmlString)
        }

        task.resume()
    }

    func parseHTML(html: String) {
        do {
            let document = try SwiftSoup.parse(html)
            let title = try document.title()
            let body = try document.body()?.text()
            
            DispatchQueue.main.async {
                self.updateUI(title: title, body: body ?? "No body content")
            }
        } catch {
            DispatchQueue.main.async {
                self.updateUI(title: "Error parsing HTML", body: "\(error)")
            }
        }
    }

    func updateUI(title: String, body: String) {
        self.titleLabel.text = title
        self.bodyTextView.text = body
    }
}
