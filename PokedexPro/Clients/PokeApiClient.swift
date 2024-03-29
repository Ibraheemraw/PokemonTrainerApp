import Foundation

struct PokeApiClient {
    
    private init(){}
    //MARK: - Helper Methods
    static func fetchPokemon(completionHandler handler: @escaping(Result<[Pokemon],NetworkError>)-> Void){
        let endpoint = "https://pokeapi.co/api/v2/pokemon/"
        guard let url = URL(string: endpoint) else {
            handler(.failure(.badURl))
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(Pokedex.self, from: data)
                    handler(.success(results.results))
                } catch {
                    handler(.failure(.jsonDecodeError(error)))
                }
            }
            if let error = error {
                handler(.failure(.apiError(error)))
            }
        }
        task.resume()
    }

    static func fetchPokemonEntryInfo(pokemonUrl url: String, completionHandler handler: @escaping(Result<PokemonInfo,NetworkError>)-> Void){
        let endpoint = url
        guard let newUrl = URL(string: endpoint) else {
            handler(.failure(.badURl))
            return }
        let request = URLRequest(url: newUrl)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let pokemonInfo = try JSONDecoder().decode(PokemonInfo.self, from: data)
                    handler(.success(pokemonInfo))
                } catch {
                   handler(.failure(.jsonDecodeError(error)))
                }
            }
            if let error = error {
                handler(.failure(.apiError(error)))
            }
        }
        task.resume()
    }

}
