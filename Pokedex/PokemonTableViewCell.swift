//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Training on 11/17/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokeImage: UIImageView!
    
    @IBOutlet weak var pokeName: UILabel!
    
    @IBOutlet weak var pokeType: UILabel!
    
    @IBOutlet weak var pokeNum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
