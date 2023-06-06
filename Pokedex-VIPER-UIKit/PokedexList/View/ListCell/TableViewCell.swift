//
//  TableViewCell.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var namePokemonCell: UILabel!
    @IBOutlet weak var imagePokemonCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        imagePokemonCell.layer.cornerRadius = 20
    }
    
}
