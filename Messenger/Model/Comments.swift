//
//  Comments.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation

struct Comments: Decodable {
    let postID: Int
    let body: String
    let idForPost: Int
    
    init?(json: NSDictionary){
        guard
            let postID = json["postId"] as? Int,
            let body = json["body"] as? String,
            let idForPost = json["id"] as? Int else { return nil }
        self.postID = postID
        self.body = body
        self.idForPost = idForPost
    }
}

