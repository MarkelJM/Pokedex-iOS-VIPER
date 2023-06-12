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
    
    func createDetailModule(with pokemon: PokemonModel) -> UIViewController {
        /* método en router para crear el módulo de detalle*/
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)
        view.pokemon = pokemon
        return view
    }

    
    func navigateToPokemonDetail(_ pokemon: PokemonModel) {
        let detailVC = createDetailModule(with: pokemon)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }

}
