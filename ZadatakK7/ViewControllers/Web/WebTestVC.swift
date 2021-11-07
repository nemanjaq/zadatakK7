//
//  WebTestVC.swift
//  ZadatakK7
//
//  Created by nemanjak on 07/11/2021.
//

import UIKit
import WebKit

final class WebTestVC: UIViewController {
  
  @IBOutlet var webView: WKWebView!
  
  let testURLString = "https://www.apple.com"
  
  var activityIndicator: UIActivityIndicatorView?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.navigationDelegate = self
    loadURL(from: testURLString)
  }
}


// MARK: - Update

extension WebTestVC {
  
  // MARK: Load URL
  
  func loadURL(from urlString: String) {
    guard let url = URL(string: urlString) else {
      print("URL error")
      return
    }
    
    let request = URLRequest(url: url)
    startActivityIndicator()
    webView.load(request)
  }
  
  // MARK: Activity Indicator
  
  func startActivityIndicator() {
    activityIndicator = UIActivityIndicatorView(style: .large)
    
    if let activityIndicator = activityIndicator {
      view.addSubview(activityIndicator)
      activityIndicator.center = view.center
      activityIndicator.startAnimating()
    }
  }
  
  func stopActivityIndicator() {
    activityIndicator?.removeFromSuperview()
    activityIndicator = nil
  }
  
}


// MARK: - Action

extension WebTestVC: WKNavigationDelegate {
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    stopActivityIndicator()
  }
  
}


// MARK: - Action

extension WebTestVC {
  
  @IBAction func didPressButtonClose(_ sender: Any) {
    dismiss(animated: true)
  }
  
}

