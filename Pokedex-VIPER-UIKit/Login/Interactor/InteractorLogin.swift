//
//  InteractorLogin.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import Foundation


protocol InputInteractorLoginProtocol : AnyObject{
    func handleStartButtonTapped()
}

protocol OutputInteractorLoginProtocol: AnyObject{
    func didSuccessfullyHandleStartButtonTapped()
    func didFailHandlingStartButtonTapped(withError error: Error)
}

class InteractorLogin: InputInteractorLoginProtocol{
    weak var presenter: OutputInteractorLoginProtocol?
    
    func handleStartButtonTapped() {
        print("Manejo del botón de inicio presionado.")
        presenter?.didSuccessfullyHandleStartButtonTapped()
        
        
    }
}
