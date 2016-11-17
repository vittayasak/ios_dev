//
//  PokemonTableViewController.swift
//  Pokedex
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController ,UISearchResultsUpdating{
    
    var pokemons:[[String:AnyObject]]!
    var filteredPokemons = [[String:AnyObject]]()
    var searchController = UISearchController()
    
     func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredPokemons = pokemons.filter { data in
            return  (data["name"] as! String).lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://pokedex-67742.firebaseio.com/pokedex.json"
        pokemons = JSONUtil.getDataFromURL(urlStr: url, rootObj:"pokemon")

        
        
        self.searchController.loadViewIfNeeded()
        
        self.searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
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
        if(self.searchController.isActive  && self.searchController.searchBar.text != ""){
            return self.filteredPokemons.count
        }
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! PokemonTableViewCell
        
        let idx = indexPath.row
        var pk = pokemons[idx] as! [String:AnyObject]
        if(self.searchController.isActive  && self.searchController.searchBar.text != ""){
            pk = filteredPokemons[idx] as! [String:AnyObject]
        }
        
        
        let name = pk["name"] as! String
        let num = pk["num"] as! String
        let ptype = pk["type"] as! String
        let imgUrl = pk["img"] as! String
        
        cell.pokeName.text = name
        cell.pokeNum.text = num
        cell.pokeType.text = "Type: \(ptype)"
        ImageUtil.loadImageByURL(imgView: cell.pokeImage, urlStr: imgUrl)
        

        return cell
    }
   

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
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
//    pk = [String:AnyObject]
//    [pk] = [[String:AnyObject]]
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let idx = self.tableView.indexPathForSelectedRow?.row
        let vc = segue.destination as! PokeDetailViewController
        let pk = pokemons[idx!] as [String:AnyObject]
        vc.pk = pk
        
    }
   

}
