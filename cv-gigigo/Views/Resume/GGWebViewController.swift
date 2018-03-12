//
//  GGWebViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 11/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import Foundation
import UIKit

class GGWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.loadRequest(URLRequest(url: url!));
    }
    
}
