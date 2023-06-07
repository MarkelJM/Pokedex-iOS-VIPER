//
//  PresenterLogin.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import Foundation
import UIKit

protocol PresenterLoginProtocol : AnyObject{
    func startButtonWasPressed()
}

class PresenterLogin: PresenterLoginProtocol{
    weak var view: LoginViewControllerProtocol?
    var interactor: InputInteractorLoginProtocol?
    var router: RouterLoginProtocol?
    
    /* para interactuar con el boton de la view*/
    func startButtonWasPressed() {
        print("Botón de inicio presionado.")
        interactor?.handleStartButtonTapped()
    }
}

extension PresenterLogin: OutputInteractorLoginProtocol {
    func didSuccessfullyHandleStartButtonTapped() {
        router?.navigateToPokemonList()
    }
    
    func didFailHandlingStartButtonTapped(withError error: Error) {
        view?.showError(error)
    }
}


