//
//  ViewController.swift
//  DribbleClient1
//
//  Created by rjk on 5/12/2015.
//  Copyright © 2015 Techiepandas. All rights reserved.
//

import UIKit
//import SDWebImage
import PageMenu

class ViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let controller2 = storyboard.instantiateViewControllerWithIdentifier("second") as! SecondVC
       
        
        
        //let secondVC = self.storyboard!.instantiateViewControllerWithIdentifier("SecondVC")
        //secondVC.title = "SAMPLE TITLE"
        controllerArray.append(controller2)
        
        let thridVC = storyboard.instantiateViewControllerWithIdentifier("third") as! ThirdVC
        
       // thridVC.title = "Third TITLE"
        controllerArray.append(thridVC)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

