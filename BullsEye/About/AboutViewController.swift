//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Daniel Vieira on 09/01/21.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request);
        }

    }
    
    @IBAction func closeView(){
        dismiss(animated: true, completion: nil)
    }

}
