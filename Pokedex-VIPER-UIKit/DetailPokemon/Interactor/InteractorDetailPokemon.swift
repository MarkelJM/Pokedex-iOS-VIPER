//
//  InteractorDetailPokemon.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 12/6/23.
//

import Foundation
import Foundation

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
}

protocol DetailInteractorOutputProtocol: AnyObject {
    // Aquí puedes agregar cualquier método que necesites para enviar datos del interactor al presenter
}

class DetailInteractor: DetailInteractorProtocol {
    weak var presenter: DetailInteractorOutputProtocol?
}
