import UIKit

class TrainerProfileController: UIViewController {
    // MARK: - Outlets and Properties
    @IBOutlet weak var profileImageView: CircularImageView!
    
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerRegion: UILabel!
    @IBOutlet weak var numberOfPokemonDiscovered: UILabel!
    @IBOutlet weak var numberOfbadgesEarned: UILabel!
    @IBOutlet weak var trainerBio: UITextView!
    public var numOfbadges = 0
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions and Methods
    @IBAction func unwindFromEditTrainerProfileController(_ segue: UIStoryboardSegue){
        let editTPC = segue.source as! EditTrainerProfileController
        #warning("connect the properties from the edit to the main profile")
        trainerName.text = "Name: \(editTPC.username)"
        trainerRegion.text = "Region: \(editTPC.region)"
        numberOfPokemonDiscovered.text = "Pokedex Count: THIS IS FOR WHEN YOU FAVORITE"
        numOfbadges = editTPC.numOfBadges
    }
}
