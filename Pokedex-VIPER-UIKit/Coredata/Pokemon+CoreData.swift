//
//  Pokemon+CoreData.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import Foundation
import CoreData

@objc(PokemonEntity)
public class PokemonEntity: NSManagedObject {
}

public extension PokemonEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged var id: Int64
    @NSManaged var attack: Int32
    @NSManaged var defense: Int32
    @NSManaged var descriptionPokemon: String
    @NSManaged var imageURL: String
    @NSManaged var name: String
    @NSManaged var type: String
}

extension PokemonEntity: Identifiable {}
