//
//  DribbbleBase.swift
//  DribbleClient1
//
//  Created by rjk on 5/01/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation

class DribbbleBase {
    var id: Int
    
    init(data: NSDictionary) {
        self.id = data["id"] as! Int
    }
}