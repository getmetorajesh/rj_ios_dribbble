//
//  HttpService.swift
//  DribbleClient1
//
//  Created by rjk on 13/02/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation
import UIKit

class HttpService {
    class func getJSON(url: String, callback: ((NSArray) -> Void)) {
        let nsURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(nsURL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print("error")
            }
            
            if data != nil {
                let jsonData = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSArray
                callback(jsonData)
            }
            
            session.invalidateAndCancel()
        })
        task.resume()
    }
    
}