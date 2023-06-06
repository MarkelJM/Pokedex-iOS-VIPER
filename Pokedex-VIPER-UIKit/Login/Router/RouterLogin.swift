//
//  RouterLogin.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import UIKit

protocol RouterLoginProtocol: AnyObject{
    func navigateToPokemonList()
}

class RouterLogin: RouterLoginProtocol {
    weak var viewController: UIViewController?
    
    static func logingInteraction() -> UIViewController{
        let view = LoginViewController()
        let interactor = InteractorLogin()
        let router = RouterLogin()
        let presenter = PresenterLogin()
        
        //crear interacciones
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view

        
        return view
    }
    
    func navigateToPokemonList() {
        // nombre provisional
        let pokemonListViewController = PokedexListViewController()
        viewController?.navigationController?.pushViewController(pokemonListViewController, animated: true)
    }
}

