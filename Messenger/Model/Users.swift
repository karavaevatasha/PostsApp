//
//  Users.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation

struct Users: Decodable {
    let name: String
    let id: Int
    
    init?(json: NSDictionary){
        guard
            let name = json["name"] as? String,
            let id = json["id"] as? Int else { return nil }
        self.name = name
        self.id = id
    }
}

 
