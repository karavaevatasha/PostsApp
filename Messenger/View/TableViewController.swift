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
    }

//
//    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return titles.count
//    }
//
//
//     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        let titleName = Titles[indexPath.row]
//     cell.textLabel?.text = titleName.Titles
//     cell.textLabel?.textColor = UIColor.darkGray
//
//     if task.isDone  == true {
//         cell.imageView?.image = UIImage(named: "check")
//     } else {
//         cell.imageView?.image = UIImage(named: "uncheck")
//     }
//     return cell
//     }
//
//
//    /*
//     // Override to support conditional editing of the table view.
//     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//     // Return false if you do not want the specified item to be editable.
//     return true
//     }
//     */
//
//    /*
//     // Override to support editing the table view.
//     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//     if editingStyle == .delete {
//     // Delete the row from the data source
//     tableView.deleteRows(at: [indexPath], with: .fade)
//     } else if editingStyle == .insert {
//     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//     }
//     }
//     */
//
//    /*
//     // Override to support rearranging the table view.
//     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//     }
//     */
//
//    /*
//     // Override to support conditional rearranging of the table view.
//     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//     // Return false if you do not want the item to be re-orderable.
//     return true
//     }
//     */
//
//    /*
//     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
//     */
//
//}
//
//extension TableViewController: TitlesLoaderDelegate{
//    func loaded(titles title: Titles) {
//        DispatchQueue.main.async {
//            self.titleLabel.text = title.title
//        }
//    }
//}
