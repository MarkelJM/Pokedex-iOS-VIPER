//
//  RouterDetailPokmon.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 12/6/23.
//

import Foundation
import UIKit

protocol DetailRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
}

class DetailRouter: DetailRouterProtocol {
    weak var viewController: UIViewController?
}
