//
//  BaseVC.swift
//  DribbleClient1
//
//  Created by rjk on 10/01/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation
import UIKit
import PageMenu

class BaseVC: UIViewController {
    var pageMenu: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var controllerArr: [UIViewController] = []
        
        self.navigationItem.title = "Dribble Dunk"
        
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.navigationBarTitleTextColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBarBackgroundColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        
        //let
    }
}