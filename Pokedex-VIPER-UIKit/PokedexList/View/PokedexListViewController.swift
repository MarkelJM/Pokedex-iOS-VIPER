//
//  PokedexListViewController.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import UIKit

protocol PresenterToViewProtocol: AnyObject {
    func showPokemons(_ pokemons: [PokemonModel])
    func showError(_ error: Error)
}

class PokedexListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PresenterToViewProtocol {
    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    var pokemons = [PokemonModel]()  // Arreglo para almacenar los pokemons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load start")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
        
        presenter?.viewDidLoad()  // Llama al presenter para cargar los pokemons
        print("view did load ended")
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rows:\(pokemons.count)")
        return pokemons.compactMap { $0 }.count  // cuenta sólo los elementos no nulos ya que lo pokeapi el = es nil
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! TableViewCell
        let pokemon = pokemons.compactMap { $0 }[indexPath.row]  // ignora los elementos nulos
        cell.namePokemonCell.text = pokemon.name
            
        if let imageUrl = pokemon.imageUrl, let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.imagePokemonCell.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        presenter?.didSelectPokemon(pokemon)
    }



    // Implementación del protocolo PresenterToViewProtocol
    func showPokemons(_ pokemons: [PokemonModel]) {
        self.pokemons = pokemons  // Guarda los pokemons
        tableView.reloadData()  // Recarga la tabla para mostrar los nuevos datos
    }
    /*
    func showError(_ error: Error) {
        // Muestra un alerta en caso de error
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
     */
    func showError(_ error: Error) {
        DispatchQueue.main.async {
            // Muestra un alerta en caso de error
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

