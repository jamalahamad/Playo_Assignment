//
//  DetailsViewController.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController, WKNavigationDelegate {

    var detailsWebView: WKWebView!

    var webUrlStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setWebView()
        loadWebView()
    }
    
    override func loadView() {
        self.view = detailsWebView
    }

    func setWebView() {
        detailsWebView = WKWebView()
        detailsWebView.navigationDelegate = self
    }
    
    func loadWebView() {
        guard let url = URL(string: webUrlStr) else {
            return
        }
        detailsWebView.load(URLRequest(url: url))
    }
}
