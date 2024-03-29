import UIKit
import Kingfisher
import Toucan
import AVFoundation

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
    public var pokemonInfo: PokemonInfo!
    public var audioPlayer = AVAudioPlayer()
    private var searchBarIsEmpty = true
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
        self.view.setGradient(cgColors: CGColor.grays)
    }
    // MARK: - Actions and Methods
    private func playSong(){
        setupBackgroundMusic()
        audioPlayer.play()
        audioPlayer.numberOfLoops = 1000
    }
    private func setupBackgroundMusic(){
        do {
            guard let url = Bundle.main.path(forResource: "themeSong", ofType: "mp3") else {
                return
            }
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            audioPlayer.prepareToPlay()
        } catch {
            print("error: \(error)")
        }
    }
    private func segueToDetailVC(myPath indexPath: IndexPath, myCollection collection: [Pokemon]){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let pokemonDetailController = storyBoard.instantiateViewController(withIdentifier: "PokemonDetailController") as? PokemonDetailController else {
            return
        }
        let pokemonSelected = collection[indexPath.row]
        pokemonDetailController.pokemonIExpect = pokemonSelected
        PokeApiClient.fetchPokemonEntryInfo(pokemonUrl: pokemonSelected.pokemonUrl.absoluteString) { [weak self] (result) in
            switch result{
            case .success(let info):
                DispatchQueue.main.async {
                   pokemonDetailController.pokemonInfoIExpect = info
                    self?.navigationController?.pushViewController(pokemonDetailController, animated: true)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: "Fetcing Data Error", alertMessage: "\(error)", alertStyle: .alert)
                }
            }
        }
    }
    private func callMethods(){
        playSong()
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
                       cell.type1.textAlignment = .center
                        cell.type2.text = ""
                    case 2:
                        cell.type1.text = info.types[0].type.name
                        cell.type2.text = info.types[1].type.name
                    default:
                       break
                    }
                    let pokemonID = info.id
                    let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemonID).png")
                    cell.pokemonImg.kf.setImage(with: url)
                    PocketMonsterCell.setCellColor(myCell: cell, pocketMonsterType: info.types[0].type.name)
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
                   return UICollectionViewCell() }
        if searchBarIsEmpty {
            setupCell(myCell: pokemonCell, pokemonList: pokemon, myPath: indexPath)
        } else {
            setupCell(myCell: pokemonCell, pokemonList: searchedPokemon, myPath: indexPath)
        }
        pokemonCell.layer.cornerRadius = 6
        return pokemonCell
    }
}

extension MainController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if searchBarIsEmpty {
        segueToDetailVC(myPath: indexPath, myCollection: pokemon)
               } else {
        segueToDetailVC(myPath: indexPath, myCollection: searchedPokemon)
               }
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
