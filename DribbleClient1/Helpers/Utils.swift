//
//  Utils.swift
//  DribbleClient1
//
//  Created by rjk on 12/01/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation
import UIKit

public class Utils {
    
    public class func getStringFromJSON(data: NSDictionary, key: String) -> String {
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }
}