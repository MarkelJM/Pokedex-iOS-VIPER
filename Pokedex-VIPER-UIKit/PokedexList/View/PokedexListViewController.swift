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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        presenter?.viewDidLoad()  // Llama al presenter para cargar los pokemons
        print("view did load ended")
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rows:\(pokemons.count)")
        return pokemons.compactMap { $0 }.count  // cuenta sólo los elementos no nulos ya que lo pokeapi el = es nil
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pokemon = pokemons.compactMap { $0 }[indexPath.row]  // ignora los elementos nulos
        print("cell")
        cell.textLabel?.text = pokemon.name
        return cell
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

