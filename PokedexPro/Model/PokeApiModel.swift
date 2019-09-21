import Foundation

struct Pokedex: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let pokemonUrl: PokemonInfo
    enum CodingKeys: String, CodingKey {
        case name
        case pokemonUrl = "url"
    }
}

struct PokemonInfo: Codable {
    let id: Int
    let moves: [MoveList]
    let stats: [PokemonStat]
    let types: [PokemonType]
    
}

struct MoveList: Codable {
    let move: Move
}

struct Move: Codable {
    let name: String
}

struct PokemonStat: Codable {
    let baseStat: Int
    let statType: StatType
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case statType = "stat"
    }
}

struct StatType: Codable {
    let name: String
}

struct PokemonType: Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}
