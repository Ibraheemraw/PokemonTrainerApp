import Foundation

struct MyPokedex: Codable, Equatable {
    let nameofPokemon: String
    let type1: String
    let type2: String
    let pokemonImage: URL
}
