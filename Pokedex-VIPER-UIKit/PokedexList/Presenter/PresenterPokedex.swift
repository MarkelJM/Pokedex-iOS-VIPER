//
//  PresenterPokedex.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import Foundation

protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PokedexRouterProtocolo? { get set }
    
    func viewDidLoad()
    func didSelectPokemon(_ pokemon: PokemonModel)
}

protocol InteractorToPresenterProtocol: AnyObject {
    func didFetchPokemons(_ pokemons: [PokemonModel?])
    func didFailFetchingPokemons(withError error: Error)
}


class PokedexListPresenter: ViewToPresenterProtocol , InteractorToPresenterProtocol{
    
    
    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PokedexRouterProtocolo?
    
    func viewDidLoad() {
        print("Presenter: viewDidLoad")
        interactor?.fetchPokemons()
    }
    
    func didSelectPokemon(_ pokemon: PokemonModel) {
        router?.navigateToPokemonDetail(pokemon)
    }
    /*
    func didFetchPokemons(_ pokemons: [PokemonModel]) {
        DispatchQueue.main.async {
            self.view?.showPokemons(pokemons)  // Llama al método del view para mostrar los pokemons
        }
    }
     */
    func didFetchPokemons(_ pokemons: [PokemonModel?]) {
        let validPokemons = pokemons.compactMap { $0 }  // ignora los elementos nulos
        DispatchQueue.main.async {
            self.view?.showPokemons(validPokemons) // Llama al método del view para mostrar los pokemons
        }
    }


    
    func didFailFetchingPokemons(withError error: Error) {
        view?.showError(error)  // Llama al método del view para mostrar el error
    }
}















