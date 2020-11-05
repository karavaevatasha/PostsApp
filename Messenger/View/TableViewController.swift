//
//  TableViewController.swift
//  Messenger
//
//  Created by Nataliia on 03.11.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var titlesTable: UITableView!
    
    var titles: [Titles] = []
    var lastIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titlesTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AlamofireNetworkRequest().loadAlomafireTitles { titles in
            self.titles = titles
            self.titlesTable.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (titles.count)
        guard titles.count != 0 else {return 1}
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if titles.count != 0 {
            let model = titles[indexPath.row]
            print (model)
            cell.titleLabel.text = model.title
        } else {
            cell.titleLabel.text = "Error"
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination as! DetailsViewController
        
        let title = titles[self.lastIndexPath!.row]
       
        detailsViewController.titles = title
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.lastIndexPath = indexPath
        return indexPath
    }
}
