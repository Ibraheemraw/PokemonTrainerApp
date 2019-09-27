import UIKit
import Kingfisher

class PokedexController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pokedexCollectionView: UICollectionView!
    private var entries = [MyPokedex](){
        didSet{
            DispatchQueue.main.async {
                self.pokedexCollectionView.reloadData()
            }
        }
    }
    private var searchedEntries = [MyPokedex](){
        didSet{
            DispatchQueue.main.async {
                self.pokedexCollectionView.reloadData()
            }
        }
    }
    private var searchBarIsEmpty = true
    private var pokedexDataManager = ItemsDataManager<MyPokedex>()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPokemon()
    }
    // MARK: - Actions and Methods
    private func callMethods(){
        setupOutLets()
        fetchPokemon()
    }
    private func fetchPokemon(){
        self.entries = pokedexDataManager.fetchItemsFromDocumentsDirectory()
    }
    private func setupOutLets(){
        searchBar.delegate = self
        pokedexCollectionView.delegate = self
        pokedexCollectionView.dataSource = self
    }
    private func setupCollectionViewlayout(){
        let width = (view.frame.size.width - 10) / 2
        let layout = pokedexCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        pokedexCollectionView.layer.cornerRadius = 5
    }

}

extension PokedexController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var userText = searchBar.text else { return }
        if userText.isEmpty {
            searchBarIsEmpty = true
            pokedexCollectionView.reloadData()
        } else {
            searchBarIsEmpty = false
            userText = userText.lowercased()
            searchedEntries = pokedexDataManager.fetchItemsFromDocumentsDirectory().filter{$0.nameofPokemon.lowercased().contains(userText) || $0.nameofPokemon.uppercased().contains(userText)}
            pokedexCollectionView.reloadData()
        }
        searchBar.resignFirstResponder()
        return
    }
}

extension PokedexController: UICollectionViewDelegate {
    
}

extension PokedexController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pokedexCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokedexCell", for: indexPath) as? PokedexCell else {
            showAlert(alertTitle: "Cell ID Issue", alertMessage: "Wrong Cell ID", alertStyle: .alert)
            return UICollectionViewCell()
        }
        if searchBarIsEmpty {
            let pokedexEntry = pokedexDataManager.fetchItemsFromDocumentsDirectory()[indexPath.row]
            pokedexCell.pokemonName.text = pokedexEntry.nameofPokemon
            pokedexCell.type1.text = pokedexEntry.type1
            if pokedexEntry.type2.isEmpty {
                pokedexCell.type2.text = ""
            } else {
                pokedexCell.type2.text = pokedexEntry.type2
            }
            pokedexCell.pokemonImage.kf.setImage(with: pokedexEntry.pokemonImage)
        } else {
            let pokedexEntry = searchedEntries[indexPath.row]
            pokedexCell.pokemonName.text = pokedexEntry.nameofPokemon
            pokedexCell.type1.text = pokedexEntry.type1
            if pokedexEntry.type2.isEmpty {
                pokedexCell.type2.text = ""
            } else {
                pokedexCell.type2.text = pokedexEntry.type2
            }
            pokedexCell.pokemonImage.kf.setImage(with: pokedexEntry.pokemonImage)
        }
        return pokedexCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchBarIsEmpty {
            return pokedexDataManager.fetchItemsFromDocumentsDirectory().count
        } else {
            return searchedEntries.count
        }
    }
}

