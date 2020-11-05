//
//  DetailsViewController.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//
//2) Экран деталей
//На экране деталей о публикации будут:
//
//Автор.
//Описание (через тело).
//Количество комментариев.
//
//Вы можете получить информацию из этих API:
//
//https://jsonplaceholder.typicode.com/users
//https://jsonplaceholder.typicode.com/comments

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
     var authors: [Users] = []
     var comments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsersLoader.shared.delegate = self
               UsersLoader.shared.loadUsers()
        CommentsLoader.shared.delegate = self
               CommentsLoader.shared.loadComments()
    }
}
extension DetailsViewController: UsersLoaderDelegate{
    func loaded(users user: Users) {
        DispatchQueue.main.async {
            self.authorLabel.text = user.name
        }
    }
}

extension DetailsViewController: CommentsLoaderDelegate{
    func loaded(comments comment: Comments) {
        DispatchQueue.main.async {
            self.bodyLabel.text = comment.body
            self.commentsLabel.text = "\(Int(comment.postID))"
        }
    }
}
