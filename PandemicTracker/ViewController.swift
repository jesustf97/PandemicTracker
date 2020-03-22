//
//  ViewController.swift
//  Pandemic-Tracker
//
//  Created by Jesús Calleja Rodríguez on 21/03/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var wkWebView: WKWebView?
    var uiWebView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Get main screen rect size
        let screenSize: CGRect = UIScreen.main.bounds
        
        // Construct frame where webview will be pop
        let frameRect: CGRect = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)

        
       // let webDesktop =
        //"https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6"
        
        let webMobile =
        "https://www.arcgis.com/apps/opsdashboard/index.html#/85320e2ea5424dfaaa75ae62e5c06e61"
        
        
        let indexPaths = NSURL(string: webMobile);
        
        
        let requestObj: NSURLRequest = NSURLRequest(url: indexPaths! as URL);
        
        // Test operating system
        if ProcessInfo().isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 8, minorVersion: 0, patchVersion: 0)) {
            
            self.wkWebView?.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
            
            self.wkWebView = WKWebView(frame: frameRect)
            self.wkWebView?.load(requestObj as URLRequest)
            self.view.addSubview(self.wkWebView!)

        } else {

            self.uiWebView = UIWebView(frame: frameRect)
            self.uiWebView?.loadRequest(requestObj as URLRequest)
            self.view.addSubview(self.uiWebView!)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Commented:    black status bar.
    //Uncommented:  white status bar.

}


