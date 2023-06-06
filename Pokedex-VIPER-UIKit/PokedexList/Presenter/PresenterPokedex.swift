//
//  PresenterPokedex.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import Foundation

protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToPokedexListViewProtocol? { get set }
    var interactor: PresenterToPokedexListInteractorProtocol? { get set }
    var router: PokedexRouterProtocolo? { get set }
    
    func viewDidLoad()
    func didSelectPokemon(_ pokemon: PokemonModel)
}

protocol InteractorToPresenterProtocol: AnyObject {
    func didFetchPokemons(_ pokemons: [PokemonModel])
    func didFailFetchingPokemons(withError error: Error)
}


class PokedexListPresenter: ViewToPresenterProtocol {
    weak var view: PresenterToPokedexListViewProtocol?
    var interactor: PresenterToPokedexListInteractorProtocol?
    var router: PokedexRouterProtocolo?
    
    func viewDidLoad() {
        interactor?.fetchPokemons()
    }
    
    func didSelectPokemon(_ pokemon: PokemonModel) {
        router?.navigateToPokemonDetail(pokemon)
    }
}















