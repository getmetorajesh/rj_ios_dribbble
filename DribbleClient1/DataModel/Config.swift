//
//  Config.swift
//  DribbleClient1
//
//  Created by rjk on 12/01/2016.
//  Copyright © 2016 Techiepandas. All rights reserved.
//

import Foundation

struct Config {
    static let ACCESS_TOKEN = "bc1dea2205e5c49ba56bdbe3985564d567688fa29c065ca3a0723af074718db5"
    static let SHOT_URL = "https://api.dribbble.com/v1/shots"
    static let POPULAR_URL = SHOT_URL + "?sort="
    static let RECENT_URL = SHOT_URL + "?sort=recent"
    static let GIF_URL = SHOT_URL + "?sort=&list=animated?per_page=3"
    static let REBOUNDS_URL = SHOT_URL + "?sort=&list=rebounds"
    static let TEAMS_URL = SHOT_URL + "?sort=&list=teams"
}