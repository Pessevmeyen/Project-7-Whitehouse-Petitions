//
//  DetailViewController.swift
//  Project7
//
//  Created by Furkan Eruçar on 8.04.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        guard let detailItem = detailItem else { // That guard at the beginning unwraps detailItem into itself if it has a value, which makes sure we exit the method if for some reason we didn’t get any data passed into the detail view controller.
            return
        }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=">
        <style> body { font-size: 150% } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil) // there's a Swift string called html that contains everything needed to show the page, and that's passed in to the web view's loadHTMLString() method so that it gets loaded.
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
