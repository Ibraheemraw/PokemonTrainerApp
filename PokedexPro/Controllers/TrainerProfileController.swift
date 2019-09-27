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
    @IBAction func unwindFromEditTrainerProfileController(_ segue: UIStoryboardSegue){
        let editTPC = segue.source as! EditTrainerProfileController
        #warning("connect the properties from the edit to the main profile")
        trainerCardView.trainerName.text = "Name: \(editTPC.username)"
        trainerCardView.region.text = "Region: \(editTPC.region)"
        numOfbadges = editTPC.numOfBadges
        trainerBio.text = editTPC.trainerBio
        trainerCardView.trainerProfileImage.image = editTPC.userProfileImage
    }
    private func setBackgrougnColor(){
        guard let region = trainerCardView.region.text, !region.isEmpty else {
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
