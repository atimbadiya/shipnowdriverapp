//
//  WebViewController.swift
//  Apporio Taxi
//
//  Created by AppOrio on 04/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController,WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var webkitView: WKWebView!
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    var weblinkurl = ""
    
    @IBOutlet weak var promotionstextlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        promotionstextlabel.text = "Promotions".localized
        
       // let url = "http://peoplespensiontrust.com/dropping"
        
        print(weblinkurl)
        
        let url1 = URL(string: weblinkurl)
        let request = URLRequest(url: url1!)
        webkitView.navigationDelegate = self
        webkitView.uiDelegate = self
        
        activityindicator.hidesWhenStopped = true
        activityindicator.startAnimating()
        webkitView.load(request)
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityindicator.stopAnimating()
    }
}
