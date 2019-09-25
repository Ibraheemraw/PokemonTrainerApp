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
    public var searchedPokemon = [Pokemon](){
        didSet{
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    private var searchBarIsEmpty = true
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    // MARK: - Actions and Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PokemonDetailController, let cell = sender as? PokemonCell, let indexpath = pokemonCollectionView.indexPath(for: cell) else {
            showAlert(alertTitle: "Error with Segue", alertMessage: "Check: destination, cell, and indexPath", alertStyle: .alert)
            return }
        if searchBarIsEmpty{
            setupSegeueInfo(pokemonList: pokemon, myPath: indexpath, myDestination: destination)
        } else {
            setupSegeueInfo(pokemonList: searchedPokemon, myPath: indexpath, myDestination: destination)
        }
    }
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
    private func setupSegeueInfo(pokemonList list: [Pokemon], myPath indexPath: IndexPath, myDestination destination: PokemonDetailController){
        let pokemonSelected = list[indexPath.row]
        destination.pokemonIExpect = pokemonSelected
        PokeApiClient.fetchPokemonEntryInfo(pokemonUrl: pokemonSelected.pokemonUrl.absoluteString)  { [weak self] (result) in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    destination.pokemonInfoIExpect = info
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: "Fetcing Data Error", alertMessage: "\(error)", alertStyle: .alert)
                }
            }
        }
    }
    private func setupCell(myCell cell: PokemonCell, pokemonList list: [Pokemon],myPath indexPath: IndexPath){
        let settingCells = list[indexPath.row]
        cell.pokemonName.text = settingCells.name
        let pokemonEndpoint = settingCells.pokemonUrl.absoluteString
        PokeApiClient.fetchPokemonEntryInfo(pokemonUrl: pokemonEndpoint){ [weak self] (result) in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    switch info.types.count {
                    case 1:
                       cell.type1.text = info.types[0].type.name
                        cell.type2.text = ""
                    case 2:
                        cell.type1.text = info.types[0].type.name
                        cell.type2.text = info.types[1].type.name
                    default:
                        self?.showAlert(alertTitle: "Type Issue", alertMessage: "No Types Avaible for a caertain pokemon", alertStyle: .alert)
                    }
                    let pokemonID = info.id
                    let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemonID).png")
                    cell.pokemonImg.kf.setImage(with: url)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: "Fetcing Data Error", alertMessage: "\(error)", alertStyle: .alert)
                }
            }
        }
    }
}

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchBarIsEmpty{
            return pokemon.count
        } else {
            return searchedPokemon.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pokemonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else {
                   showAlert(alertTitle: "Cell Creation Error", alertMessage: "was not able to load the custom cell created", alertStyle: .alert)
                   return UICollectionViewCell() }
        if searchBarIsEmpty {
            setupCell(myCell: pokemonCell, pokemonList: pokemon, myPath: indexPath)
        } else {
            setupCell(myCell: pokemonCell, pokemonList: searchedPokemon, myPath: indexPath)
        }
        return pokemonCell
    }
}

extension MainController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension MainController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var userText = searchBar.text else { return }
        if userText.isEmpty {
            searchBarIsEmpty = true
            pokemonCollectionView.reloadData()
        } else {
            searchBarIsEmpty = false
            userText = userText.lowercased()
            searchedPokemon = pokemon.filter{$0.name.lowercased().contains(userText) || $0.name.uppercased().contains(userText)}
            pokemonCollectionView.reloadData()
        }
        searchBar.resignFirstResponder()
        return
    }
}
