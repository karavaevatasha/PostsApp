//
//  DetailsLoader.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//
//Тебе нужно передать что нажили на ячейку, у которой id такой-то
//А потом из массива json вытащить инфу по этому id

import Foundation

protocol UsersLoaderDelegate{
    func loaded(users: Users)
}
class UsersLoader{
    var delegate: UsersLoaderDelegate?
    
static let shared = UsersLoader()
    
    func loadUsers(){

        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
               let jsonArray = json as? NSArray,
               let jsonDict = jsonArray.firstObject as? NSDictionary {
                print(type(of: json))
                

                if let user = Users(json: jsonDict) {
                    DispatchQueue.main.async {
                        print(user)
                        self.delegate?.loaded(users: user)
                    }
                }
            }
        }
        task.resume()
    }
}
    

protocol CommentsLoaderDelegate{
    func loaded(comments: Comments)
}
class CommentsLoader{
    var delegate: CommentsLoaderDelegate?
    
static let shared = CommentsLoader()
    
   func loadComments(){

           let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!

           let request = URLRequest(url: url)
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                  let jsonArray = json as? NSArray,
                  let jsonDict = jsonArray.firstObject as? NSDictionary {

//                let Id = 1
//                let allIdComments = jsonArray.filter { ($0 as? NSDictionary)?["id"] as? Int == Id }
//            
//                   print("Все комменты к посту \(Id)")
//                   print(allIdComments)
//                   print("Кол-во комментов к посту \(Id)")
//                   print(allIdComments.count)
                

             print(type(of: json))
                   

                   if let comment = Comments(json: jsonDict) {
                       DispatchQueue.main.async {
                           print(comment)
                           self.delegate?.loaded(comments: comment)
                       }
                   }
               }
           }
           task.resume()
       }
}
         
