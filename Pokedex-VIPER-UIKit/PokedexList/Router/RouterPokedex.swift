//
//  RouterPokedex.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 6/6/23.
//

import Foundation
import UIKit

protocol PokedexRouterProtocolo: AnyObject {
    var viewController: UIViewController? { get set }
    
    func navigateToPokemonDetail(_ pokemon: PokemonModel)
}

class PokedexListRouter: PokedexRouterProtocolo {
    weak var viewController: UIViewController?
    
    static func createPokedexListModule() -> UIViewController {
        let view = PokedexListViewController()
        let interactor = PokedexListInteractor()
        let router = PokedexListRouter()
        let presenter = PokedexListPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.pokeApi = PokeApi() // esto es solo un ejemplo, puedes configurarlo de la manera que mejor te parezca
        router.viewController = view
        
        return view
    }
    
    func navigateToPokemonDetail(_ pokemon: PokemonModel) {
        // implementar la navegación al módulo de detalle del Pokémon aquí
    }
}
