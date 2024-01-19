//
//  WebViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    private let dataManager : DataManager = DataManager()
    var webLink: String = ""
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: webLink)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
}
