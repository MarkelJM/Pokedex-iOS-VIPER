//
//  PokeAPI.swift
//  Pokedex-VIPER-UIKit
//
//  Created by Markel Juaristi on 5/6/23.
//

import Foundation



///NUEVO API CALL

// NetworkError es una enumeración personalizada que define los tipos de errores que podrían ocurrir en el NetworkService.
enum NetworkError: Error {
    case invalidURL
    case noData
}

// Elprotocolo es como una lista de requisitos que una clase puede prometer cumplir. En este caso, cualquier cosa que sea un NetworkServiceProtocol debe tener un método fetchPokemons.

protocol PokeApiProtocol {
    // El método fetchPokemons utiliza una función de cierre (o callback) para manejar la respuesta cuando se recibe.
    // Result es una enumeración que representa el éxito o el fracaso de una operación. En este caso, si la operación es exitosa, devuelve un array de Pokemon. Si falla, devuelve un Error.
    func fetchPokemons(completion: @escaping (Result<[PokemonModel], Error>) -> Void)
}


// NetworkService es una clase que implementa el protocolo NetworkServiceProtocol.
class PokeApi: PokeApiProtocol {
    
    // Implementa el método fetchPokemons del protocolo. En este método, realiza una llamada a la API y luego pasa los datos recibidos a la función de cierre.
    func fetchPokemons(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
        
        // Trata de convertir el string de la URL en un objeto URL. Si falla, llama a la función de cierre con un error y luego termina el método.
        guard let url = URL(string: ConstantsURL.api_base_url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        // Crea una "tarea" que realizará la llamada a la API.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Si hubo un error en la llamada a la API, llama a la función de cierre con ese error y termina el método.
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Si no se recibieron datos de la llamada a la API, llama a la función de cierre con un error personalizado y termina el método.
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // Intenta decodificar los datos recibidos como un array de Pokemon. Si la decodificación falla, llama a la función de cierre con el error de decodificación.
            do {
                let pokemons = try JSONDecoder().decode([PokemonModel].self, from: data)
                // Si la decodificación es exitosa, llama a la función de cierre con los datos decodificados.
                completion(.success(pokemons))
            } catch {
                completion(.failure(error))
            }
        }
        
        // Inicia la tarea. Hasta este punto, sólo hemos definido lo que debería hacer la tarea, pero no se ha ejecutado aún.
        task.resume()
    }
}




/*
 
 protocol pokemonManagerDelegado {
     func mostrarListaPokemon(lista: [Pokemon])
 }

 struct PokemonManager {
     var delegado: pokemonManagerDelegado?
     
     func verPokemon() {
         //let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
         let urlString = ConstantsURL.api_base_url
         
         if let url = URL(string: urlString){
             let session = URLSession(configuration: .default)
             
             let tarea = session.dataTask(with: url) {datos, respuesta, error in
                 if error != nil{
                     print("error al obtener datos de API",error?.localizedDescription)
                     
                 }
                 if let datosSeguros = datos?.parseData(quitarString: "null,")  {
                     if let listaPokemon = self.parsearJSON(datosPokemon: datosSeguros){
                         print("Lista de Pokemon: ", listaPokemon)
                         delegado?.mostrarListaPokemon(lista: listaPokemon)
                     }
                     
                 }
                 
                 
             }
             tarea.resume()
         }
         

     }
     func parsearJSON(datosPokemon: Data)-> [Pokemon]? {
         let decodificador = JSONDecoder()
         do{
             let datosDecodificados = try decodificador.decode([Pokemon].self, from: datosPokemon)
             return datosDecodificados
         }catch{
             print("error al decodificar datos: ",error.localizedDescription)
             return nil
         }
     }
 }


 extension Data {
     func parseData(quitarString palabra: String) -> Data? {
         let dataAsString = String(data: self, encoding: .utf8)
         let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
         guard let data = parseDataString?.data(using: .utf8) else {return nil}
         return data
     }
 }
 */
