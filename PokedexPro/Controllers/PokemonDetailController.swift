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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      //  callMethods()
    }
    
    // MARK: - Actions and Methods
    private func callMethods(){
        #warning("Fix the issues that car commented out error message says Unexpectedly found nil while implicitly unwrapping an Optional value for the image view")
        //setupImageSettings()
      //  callGestures()
        assginValuesToOutlets()
    }
    private func assginValuesToOutlets(){
        nameOfPokemon.text =  pokemonIExpect.name
        setupPokemonMoves()
        setupPokemonImage()
    }
    private func setupPokemonMoves(){
        switch pokemonInfoIExpect.types.count {
        case 0:
            pokemonType1.text = pokemonInfoIExpect.types[0].type.name
            pokemonType2.text = ""
        case 1:
           pokemonType1.text = pokemonInfoIExpect.types[0].type.name
           pokemonType2.text = pokemonInfoIExpect.types[1].type.name
        default:
            showAlert(alertTitle: "Type Issue", alertMessage: "No Types Avaible for a caertain pokemon", alertStyle: .alert)
        }
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

    @objc private func handleLongPressAction(longPressSenderType sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            #warning("add action sheet here")
        }
    }
    @objc func doubleTapped() {
        #warning("add action sheet here")
    }
}
