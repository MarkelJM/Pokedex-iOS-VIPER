//
//  PokedexListViewController.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import UIKit

protocol PresenterToPokedexListViewProtocol: AnyObject {
    func showPokemons(_ pokemons: [PokemonModel])
    func showError(_ error: Error)
}

class PokedexListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //falta algo nose el qué, algo para pintar los pokemons
        return cell
    }
    

}
