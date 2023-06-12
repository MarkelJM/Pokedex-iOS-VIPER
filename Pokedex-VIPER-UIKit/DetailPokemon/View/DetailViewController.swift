//
//  DetailViewController.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 12/6/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionDetailPokemon: UITextView!
    @IBOutlet weak var attackDetailPokemon: UILabel!
    @IBOutlet weak var defenseDetailpokemon: UILabel!
    @IBOutlet weak var typeDetailPokemon: UILabel!
    @IBOutlet weak var imageDetailPokemon: UIImageView!
    @IBOutlet weak var nameDetailPokemon: UILabel!
    
    var pokemon: PokemonModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameDetailPokemon.text = pokemon.name
        typeDetailPokemon.text = "Type: \(pokemon.type ?? "")"
        attackDetailPokemon.text = "Attack: \(pokemon.attack ?? 0)"
        defenseDetailpokemon.text = "Defense: \(pokemon.defense ?? 0)"
        descriptionDetailPokemon.text = pokemon.description

        if let imageUrl = pokemon.imageUrl, let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageDetailPokemon.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
