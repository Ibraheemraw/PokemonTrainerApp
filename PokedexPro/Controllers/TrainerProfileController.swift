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
        setBackgrougnColor()
    }
    // MARK: - Actions and Methods
    private func callMethods(){
       fetchPokedexData()
       showNumberOfPokemonFound()
    }
    private func fetchPokedexData(){
        self.pokedex = pokedexDataManager.fetchItemsFromDocumentsDirectory()
    }
    private func showNumberOfPokemonFound(){
        trainerCardView.pokedexCount.text = "Pokedex Count: \(pokedexDataManager.fetchItemsFromDocumentsDirectory().count)"
    }
    
    @IBAction func unwindToTrainerVC(_ sender: UIStoryboardSegue){}
    private func setBackgrougnColor(){
        guard let region = trainerCardView.region.text, !region.isEmpty else {
            return
        }
        switch region {
        case "Kanto":
            view.setGradient(cgColors: CGColor.golds)
        case "Johto":
            view.setGradient(cgColors: CGColor.grays)
        case "Hoenn":
            view.setGradient(cgColors: CGColor.greens)
        case "Sinnoh":
            view.setGradient(cgColors: CGColor.pinks)
        case "Unova":
            view.setGradient(cgColors: CGColor.blacks)
        case "Kalos":
            view.setGradient(cgColors: CGColor.reds)
        case "Alola":
            view.setGradient(cgColors: CGColor.blues)
        case "Galar":
            view.setGradient(cgColors: CGColor.ices)
        default:
            break
        }
    }
//    private func setupBadgeImage(numberOfBadges badges: String){
//        #warning("setup badges with the images")
//        switch badges {
//        case "1":
//            <#code#>
//        case "2":
//            <#code#>
//        case "3":
//            <#code#>
//        case "4":
//            <#code#>
//        case "5":
//            <#code#>
//        case "6":
//            <#code#>
//        case "7":
//            <#code#>
//        case "8":
//            <#code#>
//        default:
//            break
//        }
//    }
}
