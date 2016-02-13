//
//  ShotCollectionVC.swift
//  DribbleClient1
//
//  Created by rjk on 10/01/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation
import UIKit


let reuseIdentifier_Shot = "ShotCollectionViewCell"
class ShotCollectionVC: UICollectionViewController {
    private var shots: [Shot] = [Shot]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    private var cellWidth: CGFloat = 0.0
    private var cellHeight: CGFloat = 0.0
    private var cellVerticalMargin: CGFloat = 0.0
    private var cellHorizontalMargin: CGFloat = 0.0
    
    var API_URL = Config.SHOT_URL
    var parentNavigationController = UINavigationController()
    
    var shotPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadShots() {
        self.collectionView!.backgroundColor = UIColor.hexStr("f5f5f5", alpha: 1.0)
        cellWidth = self.view.bounds.width
        cellHeight = self.view.bounds.height/2
        
        self.collectionView?.registerNib(UINib(nibName: "ShotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier_Shot)
        
        DribbbleObjectHandler.getShots(API_URL) { (shots) -> Void in
            self.shots = shots
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("refreshInvoked:"), forControlEvents: .ValueChanged)
        collectionView?.addSubview(refreshControl)
        
    }
    
    func refreshInvoked(sender: AnyObject) {
        sender.beginRefreshing()
        collectionView?.reloadData()
        sender.endRefreshing()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier_Shot, forIndexPath: indexPath) as! ShotCollectionViewCell
        
        let shot = shots[indexPath.row]
        
        cell.imageView.sd_setImageWithURL(NSURL(string: shot.imageUrl)!)
        cell.designerIcon.sd_setImageWithURL(NSURL(string: shot.avatarUrl)!)
        cell.designerIcon.layer.cornerRadius = cell.designerIcon.bounds.width / 2
        cell.designerIcon.layer.masksToBounds = true
        cell.designerIcon.layer.borderWidth = 2.0
        cell.designerIcon.layer.borderColor = UIColor.hexStr("#333333", alpha: 0.7).CGColor
        
        cell.shotName.text = shot.shotName
        cell.designerName.text = shot.designerName
        cell.viewLabel.text = String(shot.shotCount)
        
        if shots.count - 1 == indexPath.row && shotPages < 5 {
            shotPages++
            print(shotPages)
            let url = API_URL + "&page=" + String(shotPages)
            DribbbleObjectHandler.getShots(url, callback: {(shots) -> Void in
                
                for shot in shots {
                    self.shots.append(shot)
                }
            })
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellWidth - cellHorizontalMargin, height: cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellVerticalMargin
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let _ = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier_Shot, forIndexPath: indexPath) as! ShotCollectionViewCell
        let shot = shots[indexPath.row]
        
        let vc = ImageModalVC(nibName: "ImageModalVC", bundle: nil)
        //        var vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        vc.modalPresentationStyle = .FullScreen
        vc.modalTransitionStyle = .CrossDissolve
        //        vc.parentNavigationController = parentNavigationController
        vc.pageUrl = shot.htmlUrl
        vc.shotName = shot.shotName
        vc.designerName = shot.designerName
        
        let downloadQueue = dispatch_queue_create("com.naoyashiga.processdownload", nil)
        
        dispatch_async(downloadQueue){
            let data = NSData(contentsOfURL: NSURL(string: shot.imageUrl)!)
            
            var image: UIImage?
            
            if data != nil {
                shot.imageData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()){
                vc.imageView.image = image
            }
        }
        
        self.parentNavigationController.presentViewController(vc, animated: true, completion: nil)
        //        self.parentNavigationController.pushViewController(vc, animated: true)
    }
    
}