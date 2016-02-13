//
//  ImageModelVC.swift
//  DribbleClient1
//
//  Created by rjk on 13/02/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import UIKit
import Social

class ImageModalVC: UIViewController {
    var parentNavigationController = UINavigationController()
    var pageUrl = ""
    var shotName = ""
    var designerName = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func viewOriginalPageTapped(sender: UIButton) {
        shareAlert()
    }
    
    func shareAlert() {
        let actionSheet: UIAlertController = UIAlertController(title: "Share this image", message: self.navigationItem.title, preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        }
        
        let twitter = UIAlertAction(title: "Twitter", style: .Default) { (action) -> Void in
            self.tweetBtnAction()
        }
        let fb = UIAlertAction(title: "Facebook", style: .Default) { (action) -> Void in
            self.fbBtnAction()
        }
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(twitter)
        actionSheet.addAction(fb)
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    
    func fbBtnAction() {
        let vc: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        let shareText: String  = shotName + " by " + designerName
        vc.setInitialText(shareText)
        vc.addImage(imageView.image)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func tweetBtnAction() {
        let vc: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        let shareText: String  = shotName + " by " + designerName
        vc.setInitialText(shareText)
        vc.addImage(imageView.image)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
