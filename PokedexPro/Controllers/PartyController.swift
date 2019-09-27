import UIKit

class PartyController: UIViewController {
    // MARK: - Outlets and Properties
    #warning("fix contraints")
    @IBOutlet weak var tableView: UITableView!
    private var pokemon = [MyPokemonParty](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let pokemonDataManager = ItemsDataManager<MyPokemonParty>()
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
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func fetchPokemon(){
        self.pokemon = pokemonDataManager.fetchItemsFromDocumentsDirectory()
    }
}
extension PartyController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonDataManager.fetchItemsFromDocumentsDirectory().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myPokemon = pokemonDataManager.fetchItemsFromDocumentsDirectory()[indexPath.row]
        if indexPath.row % 2 != 0 {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell") as? LeftPokemonCell else {
            showAlert(alertTitle: "ID Alert", alertMessage: "issue with the cell", alertStyle: .alert)
            return UITableViewCell()
            }
            cell.pokemonName.text = myPokemon.nameOfPokemon
            cell.id.text = "\(myPokemon.pokemonID)"
            cell.pokemonImage.kf.setImage(with: myPokemon.pokemonImage)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightCell") as? RightPokemonCell else {
            showAlert(alertTitle: "ID Alert", alertMessage: "issue with the cell", alertStyle: .alert)
            return UITableViewCell()
            }
            cell.pokemonName.text = myPokemon.nameOfPokemon
            cell.id.text = "\(myPokemon.pokemonID)"
            cell.pokemonImage.kf.setImage(with: myPokemon.pokemonImage)
            return cell
        }
    }
}

extension PartyController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
