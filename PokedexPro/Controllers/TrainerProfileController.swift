import UIKit

class TrainerProfileController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var trainerCardView: TrainerCardView!
    

    @IBOutlet weak var trainerBio: UITextView!
    public var numOfbadges = ""
    private var pokedexDataManager = ItemsDataManager<MyPokedex>()
    public var pokedex = [MyPokedex]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let region = trainerCardView.region.text else {
            return
        }
        Region.setBackgrougnColor(myRegion: region, trainerCardView: trainerCardView, myView: self.view)
        setupBadgeImage(numberOfBadges: numOfbadges)
    }
    // MARK: - Actions and Methods
    private func callMethods(){
       fetchPokedexData()
       showNumberOfPokemonFound()
       setupUI()
    }
    private func setupUI(){
        trainerCardView.layer.cornerRadius = 6
        trainerCardView.bottomBannerCard.setGradient(cgColors: CGColor.grays)
        trainerCardView.topBannerCard.setGradient(cgColors: CGColor.grays)
    }
    private func fetchPokedexData(){
        self.pokedex = pokedexDataManager.fetchItemsFromDocumentsDirectory()
    }
    private func showNumberOfPokemonFound(){
        trainerCardView.pokedexCount.text = "Pokedex Count: \(pokedexDataManager.fetchItemsFromDocumentsDirectory().count)"
    }
    
    @IBAction func unwindToTrainerVC(_ sender: UIStoryboardSegue){}
    
    private func setupBadgeImage(numberOfBadges badges: String){
        switch badges {
        case "1":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
        case "2":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
        case "3":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
        case "4":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.thirdBadge.image = UIImage(named: "The Thunder Badge")
            trainerCardView.forthBadge.image = UIImage(named: "The Rainbow Badge")
        case "5":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.thirdBadge.image = UIImage(named: "The Thunder Badge")
            trainerCardView.forthBadge.image = UIImage(named: "The Rainbow Badge")
            trainerCardView.fifthBadge.image = UIImage(named: "The Soul Badge")
        case "6":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.thirdBadge.image = UIImage(named: "The Thunder Badge")
            trainerCardView.forthBadge.image = UIImage(named: "The Rainbow Badge")
            trainerCardView.fifthBadge.image = UIImage(named: "The Soul Badge")
            trainerCardView.sixthBadge.image = UIImage(named: "The Marsh Badge")
        case "7":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.thirdBadge.image = UIImage(named: "The Thunder Badge")
            trainerCardView.forthBadge.image = UIImage(named: "The Rainbow Badge")
            trainerCardView.fifthBadge.image = UIImage(named: "The Soul Badge")
            trainerCardView.sixthBadge.image = UIImage(named: "The Marsh Badge")
            trainerCardView.seventhBadge.image = UIImage(named: "The Volcano Badge")
        case "8":
            trainerCardView.firstBadge.image = UIImage(named: "The Boulder Badge")
            trainerCardView.firstBadge.image = UIImage(named: "The Cascade Badge")
            trainerCardView.thirdBadge.image = UIImage(named: "The Thunder Badge")
            trainerCardView.forthBadge.image = UIImage(named: "The Rainbow Badge")
            trainerCardView.fifthBadge.image = UIImage(named: "The Soul Badge")
            trainerCardView.sixthBadge.image = UIImage(named: "The Marsh Badge")
            trainerCardView.seventhBadge.image = UIImage(named: "The Volcano Badge")
            trainerCardView.eigthBadge.image = UIImage(named: "The Earth Badge")
        default:
            break
        }
    }
}
