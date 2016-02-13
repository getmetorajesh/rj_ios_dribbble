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
        
        let storybaord = UIStoryboard(name: "Main", bundle: nil)
        let popularShot = storybaord.instantiateViewControllerWithIdentifier("ShotCollectionVC") as! ShotCollectionVC
        popularShot.title = "Popular"
        popularShot.API_URL = Config.POPULAR_URL
        popularShot.parentNavigationController = self.navigationController!
        popularShot.loadShots()
        controllerArr.append(popularShot)
        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.scrollMenuBackgroundColor()),
            .ViewBackgroundColor(UIColor.viewBackgroundColor()),
            .SelectionIndicatorColor(UIColor.selectionIndicatorColor()),
            .BottomMenuHairlineColor(UIColor.bottomMenuHairlineColor()),
            .SelectedMenuItemLabelColor(UIColor.selectedMenuItemLabelColor()),
            .UnselectedMenuItemLabelColor(UIColor.unselectedMenuItemLabelColor()),
            .SelectionIndicatorHeight(2.0),
            .MenuItemFont(UIFont(name: "HiraKakuProN-W6", size: 13.0)!),
            .MenuHeight(34.0),
            .MenuItemWidth(80.0),
            .MenuMargin(0.0),
            //            "useMenuLikeSegmentedControl": true,
            .MenuItemSeparatorRoundEdges(true),
            //            "enableHorizontalBounce": true,
            //            "scrollAnimationDurationOnMenuItemTap": 300,
            .CenterMenuItems(true)]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArr, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
    }
}