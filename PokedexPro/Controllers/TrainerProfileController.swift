import UIKit

class TrainerProfileController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var profileImageView: CircularImageView!
    
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerRegion: UILabel!
    @IBOutlet weak var numberOfPokemonDiscovered: UILabel!
    @IBOutlet weak var numberOfbadgesEarned: UILabel!
    @IBOutlet weak var trainerBio: UITextView!
    public var numOfbadges = ""
    private var pokedexDataManager = ItemsDataManager<MyPokedex>()
    public var pokedex = [MyPokedex]()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callMethods()
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
        numberOfPokemonDiscovered.text = "\(pokedexDataManager.fetchItemsFromDocumentsDirectory().count)"
    }
    @IBAction func unwindFromEditTrainerProfileController(_ segue: UIStoryboardSegue){
        let editTPC = segue.source as! EditTrainerProfileController
        #warning("connect the properties from the edit to the main profile")
        trainerName.text = "Name: \(editTPC.username)"
        trainerRegion.text = "Region: \(editTPC.region)"
        numberOfPokemonDiscovered.text = "Pokedex Count: THIS IS FOR WHEN YOU FAVORITE"
        numOfbadges = editTPC.numOfBadges
        trainerName.text = editTPC.username
        trainerRegion.text = editTPC.region
        trainerBio.text = editTPC.trainerBio
    }
    private func setBackgrougnColor(){
        guard let region = trainerRegion.text, !region.isEmpty else {
            return
        }
        switch region {
        case "Kanto":
            print("Yellow pickachu")
        case "Johto":
            print("Gray for lugia")
        case "Hoenn":
            print("green for requaza")
        case "Sinnoh":
            print("print pink for palkia")
        case "Unova":
            print("black")
        case "Kalos":
            print("print red")
        case "Alola":
            print("blue")
        case "Galar":
            print("sky blue")
        default:
            break
        }
    }
    private func setupBadgeImage(numberOfBadges badges: String){
        #warning("setup badges with the images")
        switch badges {
        case "1":
            <#code#>
        case "2":
            <#code#>
        case "3":
            <#code#>
        case "4":
            <#code#>
        case "5":
            <#code#>
        case "6":
            <#code#>
        case "7":
            <#code#>
        case "8":
            <#code#>
        default:
            break
        }
    }
}
