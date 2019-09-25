import UIKit
import Kingfisher
import Toucan

class MainController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    public var pokemon = [Pokemon](){
        didSet{
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    // MARK: - Actions and Methods
    private func callMethods(){
        setupOutlets()
        fetchData()
        setupCollectionViewlayout()
    }
    private func setupOutlets(){
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        searchBar.delegate = self
    }
    private func fetchData(){
        PokeApiClient.fetchPokemon { [weak self] (result) in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self?.pokemon = pokemon
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: "Fetcing Data Error", alertMessage: "\(error)", alertStyle: .alert)
                }
            }
        }
    }
    private func setupCollectionViewlayout(){
        let width = (view.frame.size.width - 10) / 2
        let layout = pokemonCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        pokemonCollectionView.layer.cornerRadius = 5
    }
}

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pokemonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else {
            showAlert(alertTitle: "Cell Creation Error", alertMessage: "was not able to load the custom cell created", alertStyle: .alert)
            return UICollectionViewCell() }
        let settingCells = pokemon[indexPath.row]
        pokemonCell.pokemonName.text = settingCells.name
        let pokemonEndpoint = settingCells.pokemonUrl.absoluteString
        PokeApiClient.fetchPokemonEntryInfo(pokemonUrl: pokemonEndpoint) { [weak self] (result) in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    switch info.types.count {
                    case 1:
                       pokemonCell.type1.text = info.types[0].type.name
                        pokemonCell.type2.text = ""
                    case 2:
                        pokemonCell.type1.text = info.types[0].type.name
                        pokemonCell.type2.text = info.types[1].type.name
                    default:
                        print("no types avaible")
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: "Fetcing Data Error", alertMessage: "\(error)", alertStyle: .alert)
                }
            }
        }
        return pokemonCell
    }
}

extension MainController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension MainController: UISearchBarDelegate{
}
