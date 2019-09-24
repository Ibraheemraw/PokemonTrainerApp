import UIKit

class PokemonDetailController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var nameOfPokemon: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    @IBOutlet weak var imageOfPokemon: UIImageView!
    
    @IBOutlet weak var movesContainerView: UIView!
    @IBOutlet weak var statsContainerView:UIView!
    
    @IBOutlet weak var move1: UILabel!
    @IBOutlet weak var move2: UILabel!
    @IBOutlet weak var move3: UILabel!
    @IBOutlet weak var move4: UILabel!
    
    @IBOutlet weak var speed:UILabel!
    @IBOutlet weak var specialDefense:UILabel!
    @IBOutlet weak var specialAttack:UILabel!
    @IBOutlet weak var defense:UILabel!
    @IBOutlet weak var attack:UILabel!
    @IBOutlet weak var hp:UILabel!
    public var pokemonInfoIExpect: PokemonInfo!
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
    }
    
    // MARK: - Actions and Methods
    private func callMethods(){
        setupImageSettings()
        callGestures()
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
            movesContainerView.alpha = 1
            statsContainerView.alpha = 0
        case 1:
            movesContainerView.alpha = 0
            statsContainerView.alpha = 1
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
