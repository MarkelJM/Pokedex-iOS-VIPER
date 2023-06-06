//
//  InteractorPokedex.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import Foundation

protocol PresenterToPokedexListInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    
    func fetchPokemons()
}


class PokedexListInteractor: PresenterToPokedexListInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    var pokeApi: PokeApiProtocol? // asegúrate de inyectar una instancia de PokeApi aquí, probablemente desde el Router
    
    func fetchPokemons() {
        pokeApi?.fetchPokemons(completion: { [weak self] result in
            switch result {
            case .success(let pokemons):
                self?.presenter?.didFetchPokemons(pokemons)
            case .failure(let error):
                self?.presenter?.didFailFetchingPokemons(withError: error)
            }
        })
    }
}
