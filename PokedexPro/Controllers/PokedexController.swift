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
    private var pokedexDataManager = ItemsDataManager<MyPokedex>()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
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
    
}

extension PokedexController: UICollectionViewDelegate {
    
}

extension PokedexController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pokedexCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokedexCell", for: indexPath) as? PokedexCell else {
            showAlert(alertTitle: "Cell ID Issue", alertMessage: "Wrong Cell ID", alertStyle: .alert)
            return UICollectionViewCell()
        }
        let pokedexEntry = pokedexDataManager.fetchItemsFromDocumentsDirectory()[indexPath.row]
        pokedexCell.pokemonName.text = pokedexEntry.nameofPokemon
        pokedexCell.type1.text = pokedexEntry.type1
        if pokedexEntry.type2.isEmpty {
            pokedexCell.type2.text = ""
        } else {
            pokedexCell.type2.text = pokedexEntry.type2
        }
        pokedexCell.pokemonImage.kf.setImage(with: pokedexEntry.pokemonImage)
        return pokedexCell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedexDataManager.fetchItemsFromDocumentsDirectory().count
    }
}

