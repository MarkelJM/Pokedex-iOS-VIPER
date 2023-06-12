//
//  PresenterDetailPokemon.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 12/6/23.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    var pokemon: PokemonModel? { get set }

    func viewDidLoad()
}

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    // Aquí puedes agregar cualquier método que necesites para actualizar la vista
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    var pokemon: PokemonModel?

    func viewDidLoad() {
        // Aquí puedes hacer cualquier cosa que necesites después de que la vista se haya cargado
    }
}
