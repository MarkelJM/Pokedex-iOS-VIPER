//
//  Pokemon.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let name: String
    let imageUrl: String
    let defense: Int
    let description: String
    let type: String
}
