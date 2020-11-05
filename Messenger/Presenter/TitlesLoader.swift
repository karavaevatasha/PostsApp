//
//  TitlesLoader.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    func loadAlomafireTitles(callback: @escaping ([Titles])->()){
        
        AF.request("https://jsonplaceholder.typicode.com/posts"
            , method: .get).responseJSON { response in
                
                if let data = response.data {
                    do {
                        let titles = try JSONDecoder().decode([Titles].self, from: data)
                        callback(titles)
                    } catch let error {
                        print(error)
                    }
                }
        }
    }
}

