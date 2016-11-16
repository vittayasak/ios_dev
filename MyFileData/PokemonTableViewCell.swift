//
//  PokemonTableViewCell.swift
//  MyFileData
//
//  Created by Training on 11/16/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokeNum: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    
    @IBOutlet weak var pokeTitle: UILabel!
    
    @IBOutlet weak var pokeType: UILabel!
    
    @IBOutlet weak var pokeWeight: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
