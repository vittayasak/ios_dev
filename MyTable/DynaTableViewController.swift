//
//  DynaTableViewController.swift
//  MyTable
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class DynaTableViewController: UITableViewController ,UISearchResultsUpdating{
    var data = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                "Pear", "Pineapple", "Raspberry", "Strawberry"]

    var filterData = [String]()
    var resultSearchController = UISearchController()
    
    func updateSearchResults(for searchController: UISearchController) {
               filterData.removeAll(keepingCapacity: false)
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@",             searchController.searchBar.text!)
        let array = (data as NSArray).filtered(using: searchPredicate)
        filterData = array as! [String]
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.tableHeaderView = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 20))
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(self.resultSearchController.isActive  && self.resultSearchController.searchBar.text != ""){
            return self.filterData.count
        }
        return data.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell01", for: indexPath)
         if(self.resultSearchController.isActive && self.resultSearchController.searchBar.text != ""){
           cell.textLabel?.text="\(filterData[indexPath.row])"
         }else{
            cell.textLabel?.text="\(data[indexPath.row])"
          }
        
         cell.detailTextLabel?.text="Detail \(indexPath.row)"
        if(indexPath.row%2 == 0){
         cell.imageView?.image = UIImage(named: "001")
        }else{
          cell.imageView?.image = UIImage(named: "025")  
        }
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
