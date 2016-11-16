//
//  PokemonTableViewController.swift
//  MyFileData
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {

    var pokemons : [[String:AnyObject]]!
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.layoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = "https://pokedex-67742.firebaseio.com/pokedex.json"
        pokemons = JSONUtil.getDataFromURL(urlStr: url, rootObj:"pokemon")
       
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
        return pokemons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pkCell", for: indexPath) as! PokemonTableViewCell

        let idx = indexPath.row
        let pk = pokemons[idx] as! [String:AnyObject]
        
        let name = pk["name"] as! String
        let num = pk["num"] as! String
        let ptype = pk["type"] as! String
        let imgUrl = pk["img"] as! String
        let weight = pk["weight"] as! String
        cell.pokeTitle.text = name
        cell.pokeType.text = "Type: \(ptype)"
        cell.pokeWeight.text = "Weight: \(weight)"
        cell.pokeNum.text = "#\(num)"
        ImageUtil.loadImageByURL(imgView: cell.pokeImg, urlStr: imgUrl)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115.0;//Choose your custom row height
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

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let idx = self.tableView.indexPathForSelectedRow?.row
        let vc = segue.destination as! PokeDetailViewController
        let pk = pokemons[idx!] as [String:AnyObject]
     
        vc.pk = pk
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
