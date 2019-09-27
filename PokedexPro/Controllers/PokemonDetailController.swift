import UIKit

class PokemonDetailController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var nameOfPokemon: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    @IBOutlet weak var imageOfPokemon: UIImageView!
    @IBOutlet weak var statsView: StatsView!
    @IBOutlet weak var movesView: MovesView!
    public var pokemonInfoIExpect: PokemonInfo!
    public var pokemonIExpect: Pokemon!
    override var canBecomeFirstResponder: Bool{
        return true
    }
    let pokedexDataManager = ItemsDataManager<MyPokedex>()
    let partyDataManager = ItemsDataManager<MyPokemonParty>()
    // MARK: - Life Cycle
    #warning("Fix Constraint issues")
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    
    // MARK: - Actions and Methods
    private func callMethods(){
        setupImageSettings()
        callGestures()
        assginValuesToOutlets()
        setbackgroundColor()
    }
    private func setbackgroundColor(){
        guard let nameOfpokemonType = pokemonType1.text, !nameOfpokemonType.isEmpty else {return}
        PocketMonsterCell.setDetailViewBackgroundColor(viewController: self, pocketMonsterType: nameOfpokemonType)
    }
    private func assginValuesToOutlets(){
        nameOfPokemon.text =  pokemonIExpect.name
        assignTypeToPokemon()
        setupPokemonImage()
        setupPokemonStats(myView: statsView, infoIExpect: pokemonInfoIExpect)
        setupPokemonMoves(myView: movesView, infoIExpect: pokemonInfoIExpect)
    }
    private func assignTypeToPokemon(){
        switch pokemonInfoIExpect.types.count {
        case 1:
            pokemonType1.text = pokemonInfoIExpect.types[0].type.name
            pokemonType2.text = ""
            pokemonType1.textAlignment = .center
        case 2:
           pokemonType1.text = pokemonInfoIExpect.types[0].type.name
           pokemonType2.text = pokemonInfoIExpect.types[1].type.name
        default:
            showAlert(alertTitle: "Type Issue", alertMessage: "No Types Avaible for a caertain pokemon", alertStyle: .alert)
        }
    }
    private func setupPokemonStats(myView view: StatsView, infoIExpect info: PokemonInfo){
            view.speedValue.text = "Speed: \(info.stats[0].baseStat)"
            view.specialAttackValue.text = "Special Attack: \(info.stats[1].baseStat)"
            view.specialDefenseValue.text = "Special Defense: \(info.stats[2].baseStat)"
            view.defenseValue.text = "Defense: \(info.stats[3].baseStat)"
            view.attackValue.text = "Attack: \(info.stats[4].baseStat)"
            view.hpValue.text = "HP: \(info.stats[5].baseStat)"
    }
    private func setupPokemonMoves(myView view: MovesView, infoIExpect info: PokemonInfo){
        view.move1.setTitle("\(info.moves[0].move.name)", for: .normal)
        view.move2.setTitle("\(info.moves[1].move.name)", for: .normal)
        view.move3.setTitle("\(info.moves[2].move.name)", for: .normal)
        view.move4.setTitle("\(info.moves[3].move.name)", for: .normal)
    }
    private func setupPokemonImage(){
        let id = pokemonInfoIExpect.id
        let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(id).png")
        imageOfPokemon.kf.setImage(with: url)
    }
    private func setupImageSettings(){
        imageOfPokemon.isUserInteractionEnabled = true
    }
    private func callGestures(){
        setupLongPressGesture()
        setupTepGesture()
    }
    private func setupLongPressGesture(){
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressAction))
        imageOfPokemon.addGestureRecognizer(longPressGesture)
    }
    private func setupTepGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }
    @IBAction func segmentedControlWasTapped(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            statsView.contentView.alpha = 1
            movesView.contentView.alpha = 0
        case 1:
            statsView.contentView.alpha = 0
            movesView.contentView.alpha = 1
        default:
            print("no option was selected")
        }
    }
    public func savePokemonToPartyAlert(pokemonName name: String){
        let ac = UIAlertController(title: "Adding to Your party!!!", message: "You are about to add \(name) to your party. Are you sure you want to do this?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) {[weak self] (yes) in
            guard let id = self?.pokemonInfoIExpect.id, let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(id).png") else {
                return
            }
            let pokemon = MyPokemonParty(pokemonID: id, nameOfPokemon: name, pokemonImage: url)
            self?.partyDataManager.saveItemToDocumentsDirectory(item: pokemon)
        }
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        ac.addAction(yes)
        ac.addAction(no)
        present(ac, animated: true, completion: nil)
    }
    public func savePokemonToPokedexAlert(pokemonName name: String){
        let ac = UIAlertController(title: "Adding to Your Pokedex!!!", message: "You are about to log \(name) to your Pokedex. Are you sure you want to do this?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { [weak self] (yes) in
            guard let id = self?.pokemonInfoIExpect.id,let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(id).png") else {
                 self?.showAlert(alertTitle: "ID Issue", alertMessage: "No ID Avaible for a caertain pokemon", alertStyle: .alert)
                return
            }
            switch self?.pokemonInfoIExpect.types.count {
            case 1:
                let pokemonEntry = MyPokedex(nameofPokemon: name, type1: self!.pokemonInfoIExpect.types[0].type.name, type2: "", pokemonImage: url)
                self?.pokedexDataManager.saveItemToDocumentsDirectory(item: pokemonEntry)
            case 2:
                let pokemonEntry = MyPokedex(nameofPokemon: name, type1: self!.pokemonInfoIExpect.types[0].type.name, type2: self!.pokemonInfoIExpect.types[1].type.name, pokemonImage: url)
                self?.pokedexDataManager.saveItemToDocumentsDirectory(item: pokemonEntry)
            default:
                break
            }
        }
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        ac.addAction(yes)
        ac.addAction(no)
        present(ac, animated: true, completion: nil)
    }
   private func checkForName() -> String {
        guard let name = nameOfPokemon.text,!name.isEmpty else {
            showAlert(alertTitle: "Name issue", alertMessage: "Pokemon does not have a name", alertStyle: .alert)
            return "nil"
        }
        return name
    }
    @objc private func handleLongPressAction(longPressSenderType sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            savePokemonToPokedexAlert(pokemonName: checkForName())
        }
    }
    @objc func doubleTapped() {
         savePokemonToPartyAlert(pokemonName: checkForName())
    }
}
