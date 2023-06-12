//
//  InteractorPokedex.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import Foundation

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    
    func fetchPokemons()
}


class PokedexListInteractor: PresenterToInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    var pokeApi: PokeApiProtocol? // asegúrate de inyectar una instancia de PokeApi aquí, probablemente desde el Router
    
    func fetchPokemons() {
        print("Interactor: fetchPokemons")
        pokeApi?.fetchPokemons(completion: { [weak self] result in
            print("result\(result)")
            switch result {
            case .success(let pokemons):
                print("interactor api success")
                self?.presenter?.didFetchPokemons(pokemons)
            case .failure(let error):
                print("interactor api error")
                self?.presenter?.didFailFetchingPokemons(withError: error)
            }
        })
    }
    

}
