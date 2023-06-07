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
        print("Router: Creando módulo de lista de Pokedex")
        let view = PokedexListViewController()
        let interactor = PokedexListInteractor()
        let router = PokedexListRouter()
        let presenter = PokedexListPresenter()
        print("Router: Instancias creadas")
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.pokeApi = PokeApi() 
        router.viewController = view
        print("Router: Instancias conectadas")
        return view
    }
    
    func navigateToPokemonDetail(_ pokemon: PokemonModel) {
        // implementar la navegación al módulo de detalle del Pokémon aquí
    }
}
